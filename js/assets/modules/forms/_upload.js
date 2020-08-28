import jsonField from '../../tokens/field.json';
import jsonUpload from '../../tokens/upload.json';

const thumbnailTemplate = `
<li class="${jsonUpload.class}${jsonUpload.file.class} ${jsonUpload.class}${jsonUpload.file.class}{{=it.status}}" data-value="{{=it.name}}">
  <span class="${jsonUpload.class}${jsonUpload.file.class}${jsonUpload.file.name}">{{=it.name}}</span>
  <span class="${jsonUpload.class}${jsonUpload.file.class}${jsonUpload.file.icon}"></span>
  <button type="button" class="${jsonUpload.class}${jsonUpload.delete}"></button>
  {{? it.status == '--is-invalid'}}<div class="${jsonUpload.class}${jsonUpload.file.class}${jsonUpload.file.message}">Le fichier est invalide</div>{{?}}
</li>
`;

export class Upload {
  /**
   * Init upload system for forms
   * @param {Node} prmUpload HTML input[type="file"] form element
   */
  constructor(prmUpload) {
    this.upload = prmUpload;
    this.field = lm.getClosest(this.upload, `.${jsonField.class}`);
    this.wrapper = lm.getClosest(this.upload, `.${jsonUpload.class}`);
    this.hiddenValues = this.upload.nextElementSibling;
    this.sizeLimit = this.upload.dataset.size;
    this.allowedTypes = this.upload.accept;
    this.fileTable = [];
    this.miniatureList = [];

    this.upload.addEventListener('change', () => {
      _processUploadedFiles.call(this);
    });
  }
}

/**
 * Verify if we can upload a file and process it with thumbnails generation
 */
function _processUploadedFiles() {
  lm.forEach(this.upload.files, file => {
    if(!_isSizeValid(file.size, this.sizeLimit)){
      console.error('Un fichier uploadé est trop lourd');
      this.miniatureList.push(_htmlToElem(_generateThumbnail(file, jsonUpload.status.invalid)));
      // return;
    } else if(!_isTypeValid(file.type, this.allowedTypes)){
      console.error('Un fichier uploadé ne correspond pas au format attendu');
      this.miniatureList.push(_htmlToElem(_generateThumbnail(file, jsonUpload.status.invalid)));
      // return;
    } else {
      this.fileTable.push(file.name);
      this.miniatureList.push(_htmlToElem(_generateThumbnail(file, jsonUpload.status.valid)));
    }
  });

  if(this.fileTable.length === 0 ) {
    this.upload.value = '';
  }

  if(this.hiddenValues) {
    this.hiddenValues.value = this.fileTable.join(',');
  }
  
  this.miniatureListUl = this.field.querySelector('.js-field__miniatures');
  
  if(this.miniatureListUl) {
    this.wrapper.removeChild(this.miniatureListUl);
  } 

  this.wrapper.insertAdjacentHTML('beforeend', `<ul class="${jsonUpload.class}${jsonUpload.files} js-field__miniatures"></ul>`);
  this.miniatureListUl = this.field.querySelector('.js-field__miniatures');
  
  lm.forEach(this.miniatureList, miniature => {
    miniature = miniature.outerHTML;
    this.miniatureListUl.insertAdjacentHTML('beforeend', miniature);
  });

  _deleteMiniatures.call(this);

  this.upload.dispatchEvent(new Event('blur', {'target': this.upload}));
}

/**
 * Generate thumbnail for a file selected for upload
 * @param {File} prmFile
 */
function _generateThumbnail(prmFile, status) {
  const tplData = {
    'src': window.URL.createObjectURL(prmFile),
    'name': prmFile.name,
    'status': status
  };

  return lm.template(thumbnailTemplate, tplData);
}

/**
 * Init event to delete all minitatures when files are uploaded
 */
function _deleteMiniatures() {
  const miniatures = this.field.querySelector('.js-field__miniatures');
  miniatures.delegateEvent('click', `.${jsonUpload.class}${jsonUpload.delete}`, event => {
    this.miniature = lm.getClosest(event.target, `.${jsonUpload.class}${jsonUpload.file.class}`);
    this.hiddenValues.value = this.hiddenValues.value.split(',').filter(file => file !== event.target.dataset.value ).join(',');
    miniatures.removeChild(this.miniature);
    if(this.hiddenValues.value === '') {
      this.upload.value = '';
    }

    this.miniatureList.splice( this.miniatureList.indexOf(this.miniature), 1 );
  });
}

/**
 *
 * @param {Number} prmSize
 * @returns {Number} size in Kb
 */
function _convertToKb(prmSize) {
  return Math.round(prmSize / 1024);
}

/**
 *
 * @param {Number} prmFileSize
 * @param {Number} prmSizeLimit
 * @returns {Boolean} says if file's size is under size limit
 */
function _isSizeValid(prmFileSize, prmSizeLimit) {
  return _convertToKb(prmFileSize) <= prmSizeLimit;
}

/**
 *
 * @param {Number} prmFileType
 * @param {Number} prmAllowedTypes
 * @returns {Boolean} says if file's type is allowed
 */
function _isTypeValid(prmFileType, prmAllowedTypes) {
  return prmAllowedTypes.indexOf(prmFileType) >= 0;
}

/**
 *
 * @param {String} html
 * @returns {HTML Object}
 */
function _htmlToElem(html) {
  const temp = document.createElement('template');
  html = html.trim(); // Never return a space text node as a result
  temp.innerHTML = html;
  return temp.content.firstChild;
}