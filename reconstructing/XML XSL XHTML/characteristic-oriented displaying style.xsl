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
                    table {
                    border-collapse: collapse;
                    border-spacing: 0;
                    width: 100%;
                    border: 1px solid #ddd;
                    }
                    
                    h1 {
                    text-align:center;
                    }
                    
                    th, td {
                    text-align: left;
                    padding: 16px;
                    }
                    
                    th:first-child, td:first-child {
                    text-align: left;
                    }
                    
                    tr:nth-child(even) {
                    background-color: #f2f2f2
                    }
                    
                </style>
                <title>Planting Instructions</title>
            </head>
            <!-- the body starts from here -->
            <body>
                <h1>Characteristic-Oriented Format</h1>
                
                
                
                <!-- table 1: Botanic Taxonomy -->
                <h2>Botanic Taxonomy</h2>
                <table>
                    <!-- the first table row is defined here -->
                    <tr>
                        <td>Name</td>
                        <!-- 2 components of Optimal Growing Conditions -->
                        <td>Family</td>
                        <td>Life Cycle</td>
                    </tr>
                    
                    <xsl:for-each select="instructions/instruction">
                        <!-- the second table row -->
                        <tr>
                            <!-- table cell for flower name -->
                            <td>
                                <xsl:value-of select="@type"/>
                            </td>
                            
                            <!-- table cell for Family -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="introduction / family">
                                        <xsl:value-of select="introduction / family"/> <br/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>
                            </td>
                            
                            <!-- table cell for Life Cycle -->
                            <!-- Because the element of life cycle could be mentioned in different  sections under the element of instruction
                                in original materials, its XPath expression should all be started with: instructions /instruction.  If apply 
                                XSL templates, incorrect match might occur. Therefore, comparing to a XSL template, the following 
                                structure is probably more suitable to the current project. 
                                However, in order to demonstrate the study results and the diversity usage of XSLT,
                                XSL templates are applied to element of  colors later in the table of appearance in this file. -->
                            <!-- This following command allow the XSL stylesheet  to detecting and outputing all the values of the same element, 
                                The reason for developing this structural style is that, if the the editor wants to add more information about life cycle of a flower
                                plant to the XML file in the future, added information will be automatically crawled by this XSL file and displayed on the XHTML file. 
                                For the convenience of future development of the original materials, this structural style is adopted in all the table cells. -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="introduction/lifeCycle |
                                        harvest /possibleOutcome/lifeCycle |
                                        growth / growthMethods / growthSteps / lifeCycle">
                                        <xsl:value-of select="introduction / lifeCycle"/><br/>
                                        <xsl:value-of select=" harvest /possibleOutcome/lifeCycle"/><br/>
                                        <xsl:value-of select=" growth / growthMethods / growthSteps / lifeCycle"/><br/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>                               
                            </td> 
                        </tr>
                    </xsl:for-each>
                </table>
                
                
                
                <!-- table 2: Optimal Growing Conditions -->
                <h2>Optimal Growing Conditions</h2>
                <table>
                    <!-- the first table row is defined here -->
                    <tr>
                        <td>Name</td>
                        <!-- 4 components of Optimal Growing Conditions -->
                        <td>Exposure</td>
                        <td>Moisture</td>
                        <td>Soil</td>
                        <td>Temperature</td>
                    </tr>
                    
                    <!-- the rest of ten table row is defined here -->
                    <xsl:for-each select="instructions/instruction">
                        <tr>
                            <!-- table cell for flower name -->
                            <td>
                                <xsl:value-of select="@type"/>
                            </td>
                            
                         
                            <!-- Because the element of exposure, moisture, soil and temperature could be mentioned in differerent sections under the element of instruction
                                in original materials, their XPath expressions should all be started with: instructions /instruction.  If apply 
                                XSL templates, incorrect match might occur. Therefore, comparing to a XSL template, the following 
                                structure is more suitable to the current project. -->
                            <!-- table cell for flower exposure -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="planting / plantingSteps / exposure |
                                        growth / growthMethods / growthSteps / exposure">
                                        <xsl:for-each select="planting / plantingSteps / exposure">
                                        <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="growth / growthMethods / growthSteps / exposure">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>    
                            </td>
                            <!-- table cell for flower moisture -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="introduction / moistur |
                                        planting / plantingSteps / moisture |
                                        growth / growthMethods / growthSteps / moisture">
                                        <xsl:for-each select="introduction / moisture">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="planting / plantingSteps / moisture">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="growth / growthMethods / growthSteps / moisture">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>  
                            </td>
                            <!-- table cell for flower soil -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="introduction / soil |
                                        planting / plantingSteps / soil |
                                        growth / growthMethods / growthSteps / soil">
                                        <xsl:for-each select="introduction / soil">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="planting / plantingSteps / soil">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="growth / growthMethods / growthSteps / soil">
                                            <xsl:value-of select="."/><br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>  
                            </td>
                            <!-- table cell for flower temperature -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test="planting / plantingSteps / temperature |
                                        growth / growthMethods / growthSteps / temperature">
                                        <xsl:for-each select="planting / plantingSteps / temperature">
                                            <!-- In different gardening stages, the temperature requirements are different. 
                                                Thus, emphasizing the stage is necessary -->
                                            <xsl:value-of select="."/> (for <xsl:value-of select="@type"/>)
                                            <br/>
                                        </xsl:for-each>
                                        <xsl:for-each select="growth / growthMethods / growthSteps / temperature">
                                            <xsl:value-of select="."/> (for <xsl:value-of select="@type"/>)
                                            <br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>  
                            </td>
                        </tr>
                    </xsl:for-each> 
                </table>
                
                
                <!-- table 3: Appearance -->
                <h2>Appearance</h2>
                <table>
                    <!-- the first table row is defined here -->
                    <tr>
                        <td>Name</td>
                        <!-- 2 components of Optimal Growing Conditions -->
                        <td>Color</td>
                        <td>Maximum Height</td>
                        
                       
                    <!-- the rest of ten table row is defined here -->  
                    </tr>
                     <xsl:for-each select="instructions / instruction">
                        <tr>
                            <!-- table cell for flower name -->
                            <td>
                                <xsl:value-of select="@type"/>
                            </td>
                            
                            <!-- table cell for colors -->
                            <td>
                                <xsl:apply-templates select="introduction "/>
                            </td>
                            
                            <!-- table cell for height -->
                            <td>
                                <xsl:choose>
                                    <xsl:when test=" introduction / appearance / maxHeight ">
                                        <xsl:for-each select="introduction / appearance / maxHeight ">
                                            <xsl:value-of select="."/> <br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>
                             </td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                
                <!-- table 4: Other Characteristics  -->
                <h2>Other Characteristics</h2>
                <table>
                    <!-- the first table row is defined here -->
                    <tr>
                        <td>Name</td>
                        <!-- 3 components of Optimal Growing Conditions -->
                        <td>Insects</td>
                        <td>Persistence</td>
                        <td>Bed</td>
                    </tr>
                    
                    <!-- the rest of ten table row is defined here -->
                    <xsl:for-each select="instructions / instruction">
                    <tr>
                        <!-- table cell for flower name -->
                        <td>
                            <xsl:value-of select="@type"/>
                        </td>
                        
                        <!-- table cell for insect attraction/rebel -->
                        <td>
                                <xsl:choose>
                                    <xsl:when test="introduction / insect">
                                        <xsl:for-each select="introduction / insect">
                                            <xsl:value-of select="@type"/>:
                                            <xsl:value-of select="."/> <br/>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose> 
                        </td>
                        
                        
                        <!-- table cell for Persistence -->
                        <td>
                            <xsl:choose>
                                <xsl:when test="introduction / persistence">
                                    <xsl:value-of select="introduction / persistence"/> <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <p>-</p>
                                </xsl:otherwise>                                
                            </xsl:choose> 
                        </td>
                        
                        <!-- table cell for Bed -->
                        <td>   
                                <xsl:choose>
                                    <xsl:when test="introduction / bed |
                                        growth / growthMethods / growthSteps / bed">
                                            <!--  The options of bed for planting could be more than one. -->
                                        <xsl:value-of select="introduction / bed / @type"/> <br/>
                                        <xsl:value-of select="growth / growthMethods / growthSteps / bed /@type"/> <br/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <p>-</p>
                                    </xsl:otherwise>                                
                                </xsl:choose>       
                        </td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="introduction">
        <xsl:choose>
            <xsl:when test="appearance / colors">
                <xsl:for-each select="appearance / colors">
                    <xsl:value-of select="@part"/>:
                    <xsl:value-of select="."/> <br/>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <p>-</p>
            </xsl:otherwise>                                
        </xsl:choose>               
    </xsl:template>

                
</xsl:stylesheet>