<#import "../ratingstars.ftl" as ratingstars>
<#--  BLADE : REVIEWS #1  -->
<#--  Product/Service reviews (optional) : displays notation and number of reviews  -->
<#assign nbStars   = item.averageOverallRating>
<#if (nbStars)?? && (item.totalReviewCount)?? && (nbStars?has_content) && (item.totalReviewCount>0)>
  <div class="kl-blade kl-blade--reviews">
    <@ratingstars.ratingstars nbStars "16px"/> <p class="mu-ml-050">${(item.totalReviewCount)!} avis</p>
  </div>
</#if>
<#--  /BLADE : REVIEWS #1  -->
