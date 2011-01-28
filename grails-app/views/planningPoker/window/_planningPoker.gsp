<%--
  Created by IntelliJ IDEA.
  User: pol
  Date: 12/01/11
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
  <g:set var="productOwner" value="${sec.access([expression:'productOwner()'], {true})}"/>

<ul id="planning-poker-members-list">
  <g:each in="${u}" var="user">
    <li style="display:inline-block;list-style:none;padding:0 5px 0 5px; text-align:center">
        <is:avatar userid="${user.id}" class="ico"/><br/>
        ${user.firstName} ${user.lastName}
      <div class="planning-poker-carte ui-corner-all" style="width:50%; margin:auto; border:1px silver solid; height:50px"></div>
    </li>
  </g:each>
</ul>

<div id="planning-poker-table" class="ui-corner-all" style="background-color:#2e8b57; width:90%; height:100px; margin:auto; border:3px #daa520 solid"></div>
<div align="center"> <is:avatar userid="${me.id}" class="ico"/><br/>
        ${me.firstName} ${me.lastName}</div>


<ul id="planning-poker-card-list">
  <g:each in="${suite_fibo}" var="n">
    <li style="display:inline-block;list-style:none;padding:0 5px 0 5px; text-align:center">
      <div class="planning-poker-carte ui-corner-all" style="width:30px; margin:auto; font-size:1.5em; text-align:center; border:1px silver solid; height:50px">${n}</div>
    </li>
  </g:each>
</ul>


<g:each in="${stories_ne}" var="story">
    <is:postit id="${story.id}"
          miniId="${story.id}"
          title="${story.name}"
          attachment="${story.totalAttachments}"
          styleClass="story type-story-${story.type}"
          type="story"
          typeNumber="${story.type}"
          typeTitle="${is.bundleFromController(bundle:'typesBundle',value:story.type)}"
          miniValue="${story.effort >= 0 ? story.effort :'?'}"
          color="${story.feature?.color}"
          stateText="${is.bundleFromController(bundle:'stateBundle',value:story.state)}"
          controller="planningPoker"
          comment="${story.totalComments >= 0 ? story.totalComments : ''}">
    <is:truncated size="50" encodedHTML="true"><is:storyTemplate story="${story}" /></is:truncated>



    <g:if test="${story.name?.length() > 17 || is.storyTemplate(story:story).length() > 50}">
      <is:tooltipPostit
              type="story"
              id="${story.id}"
              title="${story.name}"
              text="${is.storyTemplate([story:story])} "
              apiBeforeShow="if(\$('#dropmenu').is(':visible') || \$('#postit-select-suite').is(':visible')){return false;}"
              container="\$('#window-content-${id}')"/>
    </g:if>
  </is:postit>
</g:each>


<g:each in="${stories_e}" var="story" >

    <is:postit id="${story.id}"
          miniId="${story.id}"
          title="${story.name}"
          attachment="${story.totalAttachments}"
          styleClass="story type-story-${story.type}"
          type="story"
          typeNumber="${story.type}"
          typeTitle="${is.bundleFromController(bundle:'typesBundle',value:story.type)}"
          miniValue="${story.effort >= 0 ? story.effort :'?'}"
          color="${story.feature?.color}"
          stateText="${is.bundleFromController(bundle:'stateBundle',value:story.state)}"
          controller="planningPoker"
          comment="${story.totalComments >= 0 ? story.totalComments : ''}">
    <is:truncated size="50" encodedHTML="true"><is:storyTemplate story="${story}" /></is:truncated>



    <g:if test="${story.name?.length() > 17 || is.storyTemplate(story:story).length() > 50}">
      <is:tooltipPostit
              type="story"
              id="${story.id}"
              title="${story.name}"
              text="${is.storyTemplate([story:story])} "
              apiBeforeShow="if(\$('#dropmenu').is(':visible') || \$('#postit-select-suite').is(':visible')){return false;}"
              container="\$('#window-content-${id}')"/>
    </g:if>
  </is:postit>

</g:each>
