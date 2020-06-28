<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/">
        <html>
            <head>

                <!-- adding metadata here -->
                <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
                <meta http-equiv="Content-Language" content="en-gb" />
                <meta name="author" content="Yibei CHEN"/>
                <meta name="source" content="https://www.ufseeds.com/"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Aster. https://files.ufseeds.com/uploads/Instructions-for-Growing-Aster.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Cosmos. https://files.ufseeds.com/uploads/Instructions-for-Growing-Cosmos.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Daisies. https://files.ufseeds.com/uploads/Instructions-for-Growing-Daisies.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Echinacea. https://files.ufseeds.com/uploads/Instructions-for-Growing-Echinacea.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Marigolds. https://files.ufseeds.com/uploads/Instructions-for-Growing-Marigolds.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Phlox. https://files.ufseeds.com/uploads/Instructions-for-Growing-Phlox.pdf"/>
                <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Poppies. https://files.ufseeds.com/uploads/Instructions-for-Growing-Poppies.pdf"/>
                 <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Rudbeckia. https://files.ufseeds.com/uploads/Instructions-for-Growing-Rudbeckia.pdf"/>
                 <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Salvia. https://files.ufseeds.com/uploads/Instructions-for-Growing-Salvia.pdf"/>
                 <meta name="reference" content="Urban Farmer. (n.d.). From Seed to Harvest: A beginner’s guide to growing Zinnias. https://files.ufseeds.com/uploads/Instructions-for-Growing-Zinnias.pdf"/>


                <style>

                    body {
                    line-height: 28px;
                    font-size: 15px;
                    font-family: "Roboto", sans-serif;
                    font-weight: 500;
                    }

                    img {
                    width:200px;
                    height:200px;
                    }

                    h1, h2 {
                    text-align:center;
                    }

                    h1 {
                    font-size: 44px;
                    color: #7c8d93;
                    font-family: "Roboto", sans-serif;
                    font-weight: 500;
                    text-decoration:underline
                    }

                    h2 {
                    font-size: 34px;
                    color: #7c8d93;
                    font-family: "Roboto", sans-serif;
                    font-weight: 500;
                    }

                    h3 {
                    font-size: 24px;
                    font-family: "Roboto", sans-serif;
                    font-weight: bold;
                    text-transform: uppercase;
                    color: #7c8d93;
                    padding-bottom: 5px;
                    }

                    h4 {
                    font-size: 15px;
                    font-family: "Roboto", sans-serif;
                    color: #7c8d93;
                    padding-bottom: 2px;
                    text-decoration:underline
                    }

                    p {
                    font-size: 15px;
                    line-height: 28px;
                    font-family: "Roboto", sans-serif;
                    color: #7c8d93;
                    }

                    p.pics {
                    text-align:center;
                    }


                </style>
                <title>Instructional display style</title>
            </head>
            <body>
                <xsl:for-each select="instructions / instruction ">
                    <!-- instructions are sorted alphabetically -->
                    <!-- <xsl:sort select="./@type"/> -->
                    <h1>A beginner's guide to
                        <xsl:value-of select="articleTitle/ flowerName"/>
                    </h1>
                    <!-- add two images from each instruction here -->
                    <div align="center">
                        <xsl:for-each select="articleTitle / photo / @filename">
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="."/>
                                </xsl:attribute>
                            </img>
                        </xsl:for-each>
                    </div>
                        <p class="pics">Pictures of <xsl:value-of select="articleTitle/ flowerName"/>
                        </p>


                    <h2>Is this what you are expecting? </h2>
                    <div class="intro">
                        <h3>
                            Brief Introduction:
                        </h3>
                        <p>
                            <xsl:apply-templates select="introduction"></xsl:apply-templates>
                        </p>

                        <!-- informing the results of the gardening work -->
                        <h3>
                            Possible Outcomes:
                        </h3>
                        <p>
                            <xsl:for-each select="harvest//outcome">
                                <!--  The outcome of gardening could be more than one option. -->
                                <xsl:number value="position()" format="1" />
                                <xsl:text>. </xsl:text>
                                <xsl:value-of select="."/>
                                <xsl:text>     </xsl:text>
                            </xsl:for-each>
                        </p>
                    </div>

                    <!-- telling gardeners preparation they should do and resources they should have
                        before they make a decision -->
                    <h2>What you might need</h2>
                    <div class="needs">
                        <!-- resources needed during planting -->
                        <xsl:apply-templates select="planting"></xsl:apply-templates>
                        <!-- resources needed during growth -->
                        <xsl:apply-templates select="growth"></xsl:apply-templates>
                        <!-- resources needed during harvest -->
                        <xsl:apply-templates select="harvest "></xsl:apply-templates>
                        <!-- A flowering plant's cravings -->
                        <xsl:apply-templates select="craving "></xsl:apply-templates>
                    </div>



                    <!-- listing steps in different stages and different conditions -->
                    <h2>Ready to go? Here is the instruction:</h2>

                    <h4>Purchase first:</h4>
                    <!-- fetching the advertising slogans -->
                        <p>
                            <xsl:for-each select="articleTitle / photoDescription">
                                <xsl:value-of select="."/>
                                <!-- adding URLs -->
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="articleTitle/ website / @url"/>
                                    </xsl:attribute>
                                    <xsl:value-of select="//@url"/>
                                </a>
                                <br/>
                            </xsl:for-each>
                        </p>

                    <!-- Planting steps listed here   -->
                   <div>
                       <h4>Planting Steps:</h4>
                       <p>
                           <xsl:for-each select=" planting / plantingSteps ">
                               <xsl:number value="position()" format="1" />
                               <xsl:text>. </xsl:text>
                               Condition: <xsl:value-of select="@condition"/>
                               <br/>
                               <xsl:value-of select="."/> <br/><br/>
                           </xsl:for-each>
                       </p>
                   </div>


                    <!-- Growing steps listed here   -->
                    <!-- because instructions for growing are frequently condition-oriente, a special display style is needed -->
                    <!-- the following command output each method with conditions being placed in the begining of each step,
                        and each method is followed by corresponding steps. By displaying this way, gardeners could
                        conveniently skip steps that is not relevant to their situation -->
                    <div>
                        <h4>Growing Steps:</h4>
                        <p>
                            <xsl:for-each select=" growth / growthMethods ">
                                Condition <xsl:value-of select="@nmbr"/>:
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="@condition"/>  <br/>

                                <xsl:for-each select="growthSteps">
                                    Step <xsl:value-of select=" @nmbr" />
                                    <xsl:text>. </xsl:text>
                                    <xsl:value-of select="."/> <br/><br/>
                                </xsl:for-each>

                            </xsl:for-each>
                        </p>
                    </div>

                    <!-- harvest steps listed here   -->
                    <!-- This is necessary to check if harvest steps are available in the each instruction.
                           For example, the instruction of planting Salvia does not provide harvest steps. -->
                    <xsl:if test="harvest / harvestSteps">
                        <div>
                            <h4>Harvest Steps:</h4>
                            <p>
                                <xsl:for-each select=" harvest / harvestSteps ">
                                    <xsl:number value="position()" format="1" />
                                    <xsl:text>. </xsl:text>
                                    <xsl:value-of select="."/> <br/><br/>
                                </xsl:for-each>
                            </p>
                        </div>
                    </xsl:if>


                    <!-- add restriction from the section of craving here   -->
                    <!-- This is necessary to check if restrctions are available in the each instruction. -->
                    <xsl:if test="craving / restriction">
                        <div>
                            <h4>Restriction</h4>
                            <p>
                                <!-- This is necessary to check if restrctions are conditional. -->
                                <xsl:for-each select="craving / restriction">
                                    <xsl:number value="position()" format="1" />
                                    <xsl:text>. </xsl:text>
                                    <xsl:if test="@condition">
                                        Condition: <xsl:value-of select="@condition"/>
                                        <br/>
                                    </xsl:if>
                                    <xsl:value-of select="."/> <br/><br/>
                                </xsl:for-each>
                            </p>
                        </div>
                    </xsl:if>


                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <!-- template 1: the begining of each table of introduction of flower -->
    <!--   Deliver a general description of the flower and informing them the possible harvest -->
    <xsl:template match="introduction">
        <p> <xsl:value-of select="."/>  <br/> </p>
    </xsl:template>


    <!-- template for planting preparation starts from here. -->
    <xsl:template match="planting">

        <!-- information in this div is planting materials: tools,soil, fertilizer and others.  -->
        <!-- the first component: Tools -->
        <!-- The planting steps in all original documents mentioned tools,
            therefore, no need to consider the 'if does not exist' condition. -->
        <h3>Planting Period</h3>
        <div>
            <h4>Materials</h4>
            <p class='starting'>Tools: </p>
            <p>
                <xsl:for-each select="plantingSteps/materials[@type='tools']"/>
                <xsl:number value="position()" format="1" />
                <xsl:text>. </xsl:text>
                <xsl:value-of select="//materials" />
                <xsl:text>     </xsl:text>
                <br/>
            </p>

            <!-- the second component: fertilizer -->
            <!-- I applied the following "if"commands, because the planting steps does not necessarily mentioned
                fertilizer and soil. The following command omits this div when the attribute of fertilizer,
                soil and bed cannot be found. -->
            <xsl:if test=" plantingSteps / materials[@type='fertilizer']">
                <p class="starting">Fertilizer: </p>

                <p>
                    <xsl:for-each select="plantingSteps /materials[@type='fertilizer']">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </xsl:if>



            <!-- the third component: soil -->
            <xsl:if test="plantingSteps/soil">
                <p class="starting">Soil: </p>


                <p>
                    <xsl:for-each select="plantingSteps /soil">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </xsl:if>


            <!-- the forth component: other materials -->
            <xsl:if test="plantingSteps /materials[@type='other']">
                <p class="starting">Others: </p>


                <p>
                    <xsl:for-each select="plantingSteps /materials[@type='other']">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </xsl:if>
        </div>
        <!-- the div of materials needed during plating ends here -->


        <!-- the div of spatial requirements during planting -->
        <!-- Testing if the XML files have any element for spatial requirements.
            If no element for this table, in order to make the instructions clear
            and concise, this div will be omitted. -->
        <xsl:if test="plantingSteps/space | plantingSteps/location ">
            <div>
                <h4>Spatial requirements</h4>

                <!-- testing if any element is available for location. -->
                <xsl:if test="plantingSteps/ location">
                    <p>
                        Location:
                    </p>

                    <p>
                        <xsl:for-each select="plantingSteps/location">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>     </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>


                <!-- testing if any element is available for space. -->
                <!-- Informing the planting interval is important for beginner gardeners as some flowering plants
                    require large planting space while beginners might not possess enough space -->
                <xsl:if test="plantingSteps / space">
                    <p>
                        Space:
                    </p>

                    <p>
                        <xsl:for-each select="plantingSteps / space">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>     </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

            </div>
        </xsl:if>
        <!-- the div for spatial requirements during planting ends here -->

    </xsl:template>
    <!-- template for planting preparation ends. -->


    <!-- template for growing preparation starts from here. -->
    <xsl:template match="growth">
        <!-- check if this div is needed -->
        <xsl:if test="growthMethods / growthSteps / materials |
            growthMethods /*/ soil |
            growthMethods/ growthSteps / bed ">
            <h3>Growth Period</h3>
            <div>
                <h4>
                    Materials
                </h4>

                <xsl:if test="growthMethods / growthSteps / materials[@type='tools']">
                    <p class="starting">
                        Tools:
                    </p>

                    <p>
                            <xsl:for-each select="growthMethods / growthSteps / materials[@type='tools']">
                                <xsl:number value="position()" format="1" />
                                <xsl:text>. </xsl:text>
                                <xsl:value-of select="." />
                                <xsl:text> </xsl:text>
                            </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- the second component: fertilizer -->
                <xsl:if test="growthMethods /*/ materials[@type='fertilizer']">
                    <p class="starting">
                        Fertilizer:
                    </p>

                    <p>
                        <xsl:for-each select="growthMethods  /*/ materials[@type='fertilizer'] ">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="." />
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- the third component: soil -->
                <xsl:if test="growthMethods /*/ soil">
                    <p class="starting">
                        Soil:
                    </p>

                    <p>
                        <xsl:for-each select="growthMethods  /*/  soil">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="." />
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- the forth component: bed -->
                <xsl:if test="growthMethods/ growthSteps / bed">
                    <p class="starting">
                        Bed:
                    </p>

                    <p>
                        <xsl:for-each select="growthMethods/ growthSteps / bed">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="." />
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- the five component: others -->
                <xsl:if test="growthMethods/ growthSteps / materials[@type='other']">
                    <p class="starting">
                        Others:
                    </p>

                    <p>
                        <xsl:for-each select="growthMethods/ growthSteps / materials[@type='other']">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="." />
                            <xsl:text> </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

            </div>
        </xsl:if>
        <!-- the div of meterials for growing stage ends here  -->


        <!-- the div of spatial requirements during growing -->
        <!-- Testing if the XML files have any element for spatial requirements.
            If no element for this div, in order to make the instructions clear
            and concise, this table will be omitted. -->
        <xsl:if test="growthMethods / growthSteps / space |
            growthMethods / growthSteps / location">
            <div>
                <h4>Spatial Requirements</h4>

                <xsl:if test="growthMethods / growthSteps / location">
                    <p>
                        Location:
                    </p>

                   <p>
                       <xsl:for-each select="growthMethods / growthSteps / location">
                           <xsl:number value="position()" format="1" />
                           <xsl:text>. </xsl:text>
                           <xsl:value-of select="."/>
                           <xsl:text>     </xsl:text>
                       </xsl:for-each>
                   </p>
                </xsl:if>


                <xsl:if test="growthMethods / growthSteps / space">
                    <p>
                        Planting Interval:
                    </p>

                      <p>
                          <xsl:for-each select="growthMethods / growthSteps / space">
                              <xsl:number value="position()" format="1" />
                              <xsl:text>. </xsl:text>
                              <xsl:value-of select="."/>
                              <xsl:text>     </xsl:text>
                          </xsl:for-each>
                      </p>
                </xsl:if>
            </div>
        </xsl:if>
        <!-- the div of spatial requirements during growing ends here-->

    </xsl:template>
    <!-- template for growing preparation ends. -->


    <!-- template for harvest preparation starts from here-->
    <xsl:template match="harvest">
        <!-- testing if a div for harvest materials is needed -->
        <xsl:if test="harvestSteps / materials ">
            <h3>Harvest Period</h3>
            <div>
                <h4>Materials</h4>

                <!-- testing if the paragraphs for tools is needed -->
                <xsl:if test="harvestSteps / materials[@type='tools'] ">
                    <p>
                        Tools:
                    </p>


                    <p>
                        <xsl:for-each select="harvestSteps / materials[@type='tools']">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>     </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- testing if the paragraphs for fertilizer is needed -->
                <xsl:if test="harvestSteps / materials[@type='fertilizer'] ">
                   <p>
                       Fertilizer:
                   </p>

                    <p>
                        <xsl:for-each select="harvestSteps / materials[@type='fertilizer']">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>     </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>

                <!-- testing if paragraphs for other materials is needed -->
                <xsl:if test="harvestSteps / materials[@type='other'] ">
                    <p>
                        Others:
                    </p>

                    <p>
                        <xsl:for-each select="harvestSteps / materials[@type='other']">
                            <xsl:number value="position()" format="1" />
                            <xsl:text>. </xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>     </xsl:text>
                        </xsl:for-each>
                    </p>
                </xsl:if>
            </div>
        </xsl:if>
        <!-- div for harvest materials ends here -->

        <!-- div for spatial requirements during harvest -->
        <!-- check if the XML files have any element for spatial requirements.
            If no element for this table, this table will be omitted in order to make the instructions
            clear and concise -->
        <xsl:if test="harvestSteps / location">
            <div>
                <h4>Spatial Requirements</h4>
                <p>
                    Location:
                </p>

                <p>
                    <xsl:for-each select="harvestSteps / location">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </div>
        </xsl:if>
    </xsl:template>
    <!-- template for harvest preparation ends. -->


    <!-- template for craving starts from here-->
    <xsl:template match="craving">

        <!-- check if a div of fertilizer is needed -->
        <h3>Their Cravings</h3>
        <xsl:if test="cravingItem / itemName [@type='fertilizer'] ">
            <div>
                <!-- the first common item that flowering plants crave is fertilizer -->
                <h4>Fertilizer</h4>
                <p>
                    <xsl:for-each select="cravingItem / itemName [@type='fertilizer'] ">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </div>
        </xsl:if>

        <!-- check if a div of compost is needed -->
        <xsl:if test="cravingItem / itemName [@type='compost'] ">
            <div>
                <!-- the second common item that flowering plants crave is compost -->
                <h4>Compost</h4>
                <p>
                    <xsl:for-each select="cravingItem / itemName [@type='compost'] ">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </div>
        </xsl:if>

        <!-- check if a div of other item is needed -->
        <xsl:if test="cravingItem / itemName [@type='other'] ">
            <div>
                <h4>Others</h4>
                <p>
                    <xsl:for-each select="cravingItem / itemName [@type='other'] ">
                        <xsl:number value="position()" format="1" />
                        <xsl:text>. </xsl:text>
                        <xsl:value-of select="."/>
                        <xsl:text>     </xsl:text>
                    </xsl:for-each>
                </p>
            </div>
        </xsl:if>
    </xsl:template>
    <!-- template for cravings of flowering plants ends. -->


</xsl:stylesheet>
