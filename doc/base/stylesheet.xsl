<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <xsl:template match="/">
        <xsl:variable name="file1" select="document('classes.xml')" />
        <html>
            <head>
                <title>Godot <xsl:value-of select="$file1//doc/@version"/></title>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"  media="screen,projection" />

      <!--Let browser know website is optimized for mobile-->
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>     
      <script type="text/javascript">
function expandAll(){
  $(".collapsible-header").addClass("active");
  $(".collapsible").collapsible({accordion: false});
}

function collapseAll(){
  $(".collapsible-header").removeClass(function(){
    return "active";
  });
  $(".collapsible").collapsible({accordion: true});
  $(".collapsible").collapsible({accordion: false});
}          
      </script>           
           </head>
            <body>
                    <div class="container">
                <h4 id="top">Godot <xsl:value-of select="$file1//doc/@version"/></h4>
<!--                    <ul>
                    <xsl:for-each select="doc/class">
                        <xsl:variable name="ID" select="@name" />
                        <li style="display: inline;">   
                        <a href="#{$ID}">
                            <xsl:value-of select="@name"/> 
                        </a>
                        </li> 
                                
                    </xsl:for-each>
                    </ul>-->
                    
  <a class="waves-effect waves-light btn grey" onClick="expandAll();"><i class="material-icons left">fullscreen</i>Expand All</a>&#160;
  <a class="waves-effect waves-light btn grey" onClick="collapseAll();"><i class="material-icons left">fullscreen_exit</i>Collapse All</a>
                
                <xsl:for-each select="$file1//doc/class">
                    <xsl:variable name="ID" select="@name" />
                        <div id="{$ID}" class="row"><div class="col s12">
                            
                            <h5>
                            <strong>
                                <xsl:value-of select="@name"/>
                            </strong>
                                    <xsl:if test="@inherits !=''">
                                        <span style="color: #999">
                                    &#8656;&#160;<xsl:value-of select="@inherits"/></span>
                                </xsl:if>
                                <xsl:if test="@category !=''">
                                    &#160;<span class="blue-text text-darken-2">[ <xsl:value-of select="@category"/> ]</span>
                                </xsl:if>
                                
                            &#160;<a class="btn-floating grey" href="#{$ID}"><i class="material-icons">link</i></a>
                            &#160;<a class="btn-floating grey" href="#top"><i class="material-icons">arrow_upward</i></a>
                        </h5>
                                <xsl:if test="brief_description !=''">
                                    <blockquote>
                                    <xsl:value-of select="brief_description"/>
                                    </blockquote>
                                </xsl:if>
                                <xsl:if test="description !=''">
                                    <blockquote class="blue-text text-darken-2">
                                    <xsl:value-of select="description"/>
                                    </blockquote>
                                </xsl:if>
                                
                                
                            <div class="row">
                                <div class="col s12">
                                    <ul class="collapsible" data-collapsible="expandable">
                                        
                        <!--Constants-->
                        <xsl:if test="constants/constant">
                                    <li>
                                    <div class="collapsible-header"><i class="material-icons">donut_large</i>Constants</div>
                                    <div class="collapsible-body">
                                    <span>
                                    <table class="bordered striped">
                                        <xsl:for-each select="constants/constant">
                                            <tr valign="top">
                                                <td>
                                                    <xsl:value-of select="@name"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="@value"/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                    </span>
                                    </div>
                                    </li>
                        </xsl:if>
                        <!--Methods-->
                        <xsl:if test="methods/method">
                                    <li>
                                    <div class="collapsible-header"><i class="material-icons">filter_tilt_shift</i>Methods</div>
                                    <div class="collapsible-body">
                                    <span>
                                    <table class="bordered striped" width="100%">
                                        <xsl:for-each select="methods/method">
                                            <tr valign="top">
                                                <td width="40%">
                                                    <span>
                                                    <strong>
                                                        <xsl:value-of select="return/@type"/>
                                                    </strong>&#160;<xsl:value-of select="@name"/>(<xsl:for-each select="argument">
                                                        <strong><xsl:value-of select="@type"/>&#160;</strong><xsl:value-of select="@name"/>
                                                        <xsl:if test="position() != last()">,&#160;
                                                        <xsl:if test="number(position()) mod 2 = 0"><br/><span style="margin-left: 2em;"></span></xsl:if>
                                                        </xsl:if>
                                                    </xsl:for-each>)
                                                    </span>
                                                </td>
                                                <td width="60%">
                                                    <xsl:value-of select="description"/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                    </span>
                                    </div>
                                    </li>
                        </xsl:if>
                        <!--Members-->
                        <xsl:if test="members/member">
                                    <li>
                                    <div class="collapsible-header"><i class="material-icons">extension</i>Members</div>
                                    <div class="collapsible-body">
                                    <span>
                                    <table class="bordered striped" width="100%">
                                        <thead>
                                        <tr>
                                            <th><strong>Type</strong> Name</th>
                                            <th>Member</th>
                                            <th>Setter</th>
                                            <th>Getter</th>
                                            <th>Brief</th>
                                        </tr>
                                        </thead>
                                        <xsl:for-each select="members/member">
                                            <tr valign="top">
                                                <td>
                                                    <strong>
                                                        <xsl:value-of select="@type"/>&#160;
                                                    </strong>
                                                    <xsl:value-of select="@name"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="."/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="@setter"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="@getter"/>
                                                </td>
                                                <td>
                                                    <xsl:value-of select="@brief"/>
                                                </td>
                                            </tr>
                                        </xsl:for-each>
                                    </table>
                                    </span>
                                    </div>
                                    </li>
                        </xsl:if>
                                    
                                    </ul>
                                </div>
                            </div>
                            
                            
                        </div>
                        </div>
                    </xsl:for-each>
                    </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
