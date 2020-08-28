export class PopinDee {
  constructor() {
    const buttonspopin = document.querySelectorAll('.js-popin-deee__button');
    if (buttonspopin) {
      this.popinEcotaxe = [];

      lm.forEach(buttonspopin, (button) => {
        const popinToOpen = button.dataset.popin;
        this.popinEcotaxe[popinToOpen] = new lm.Popin({'content' : `.${popinToOpen}`});
        button.addEventListener('click', () => {
          this.popinEcotaxe[popinToOpen].open();
        });
      });
    }
  }
}
