
XML+XSLT project: Instructions for Flowering Plants
=======================

## Description:
The project is a working XML-based project using source material of my choice (see copies).

I considered this project to be a pilot for a much larger project and so it was designed to allow it to be extended with the possibility of more material being added in the future.

#### Procedures:
- produce a working DTD.

- encode up to 10 documents that validate against your DTD or Schema.

- prepare at least 2 working XSL stylesheets for displaying the materials in at least two different scenarios or formats.

- generate HTML files to build a simple web site that delivers my documents according to the specifications in the stylesheets


*Notes:**

- This is an assessed student project.  This project is about the use of XML to encode documents and to process an output using XSLT. CSS and validation issues with the HTML are not taken into consideration here.

- I release this code hoping that others will use and improve on my work.


#### Rationale for the choice of materials:
1. Text-intensive tutorials:
The original materials are text-intensive which require readers to thoroughly read through the whole page to know what preparation they should do in order to plant a specific flower.  

2. Beginner-friendliness：
Complex and advanced steps are also listed in the guides. Furthermore, a few gardening steps are applicable only to certain scenarios (e.g. warmer temperature and different geographic locations). The steps that exceed beginner level should be highlighted so that beginners can choose a more flexible learning process and skip steps they consider irrelevant to their situations.

3. Commercial use：
As supplement documents on a commercial website, these instructions should evoke viewers’ desire to make purchases and improve after-purchase satisfaction. However, the original arrangement does not allow consumers to efficiently identify which flowers match their expectations and their gardening resources. Additionally, the instructional steps are not arranged with clear structure. Consumer might find the instructions hard to follow and contain too many information for less common situations. Consequently, product satisfaction might be negatively impacted.


#### Encoding Schema:
1. According to Bański and Witt (2018), complex arrangement of XML can be generally divided into three kinds: hierarchical, relation-based, and mixed. In the current project, a mixture of rational and hierarchical arrangement is used. Hierarchical arrangement focuses on relations of dominance and precedence (Bański & Witt, 2018). Adopting a hierarchical structure is mainly because of the instructional nature of original materials. In this case, a cultivation step can have multiple subordinate elements, such as tools and locations, but it is subject to only one parent node, its corresponding cultivation stage. In terms of relational arrangement, it focuses on dependency relationships among objects. With this structure, individual fragments can re-arranged based on relevance an editor spots, even if these fragments are separately displayed in different parts of the original text (Bański & Witt, 2018). The reason for adopting relational arrangement is that, after the document analysis, I found that characteristics of flowers are irregularly mentioned in different parts of materials. In order to gather scattering features of flowers and then assign them to corresponding categories for a new displaying format, the element of characteristics, such as life cycle, family, etc are first declared at the introduction part of the DTD file, and then allowed to be used as children elements inside other elements.

2. Choose DTD over Schemas: An XML Schema is an object-oriented approach to define an XML Document. Apart from that, an XML Schema provides most of the basic grammar as the DTD does, and it allow users to perform more functions than the DTD, such as data type conversion and data facet definition (Jervis, 2002). However, the basic grammar and functions of DTD are sufficient to fulfill needs in the current project. Given that DTD is more suitable for text-oriented XML document (Mahony, 2020, February 27) and the original materials are text-intensive, DTD is chosen in current project. In addition, DTD is more widely supported by XML Parsers and legacy systems than XML Schema (Jervis, 2002).

3. In class practices, the units for quantity and frequency of an item are usually encoded by attributes of elements. However, in this assignment, the whole phrase describing the amount or quantity of an item is labeled. This is because the expression used in the instructions are diverse and the measurement could be vague. For example, the description of soil and watering could be "a small sprinkling of soil" and "water regularly".

4. Steps in planting, growing, harvest methods and feeding requirements are frequently condition-specific. Therefore, attributes of condition are frequently used to clarify the conditions, which allow XSL files to fetch and display applicable conditions efficiently, so that beginner gardeners could know the applicability of each step.


#### Stylesheets:
- In the academic format:
1. thematic tables: thematic tables are used to compare natural characteristics of ten flowering plants. Readers could conveniently compare the similarities and differences between plants and find out the relationships of plants. In order to develop themes accurately and ensure the components in each thematic table are sensible in the field of botany, the tables are developed with reference to an online plant database by The Royal Horticultural Society: www.rhs.org.uk/plants/search-form.

2. Display "-" when an element cannot be found: This visual presentation could give higher extensibility. Because if a more comprehensive flower database is to be developed using this format as a basis, a simple “-” could help editors to efficiently detect which plant characteristics are missing whilst keep the overall display clear.

3. XSLT style: Because the elements related to characteristics could be mentioned in different sections under the element of instruction in original materials, their XPath expressions should all be started with: instructions/instruction. If apply XSL templates, incorrect match might occur (Tennison, 2002). However, in order to demonstrate the study results and the diversity usage of XSLT, one XSL template is applied to element of colors in characteristic-oriented stylesheet.

- In the instructional format:
1. Focusing on required resources and steps: this format conforms with the initial intention of the materials and adopts a more beginner-friendly principle. More specifically, the format mainly addresses the required resources and steps on different stages of cultivation. This instructional displaying style will be useful and convenient for audience who have limited knowledge of gardening to skim through all the requirements and steps and make the best of the gardening resources they currently possess.

2. Conditions are highlighted: The original materials frequently give instructions on less common scenarios, and these instructions with less applicability are interweaved with instructions for general cases. Highlighting the special conditions of optional steps helps gardening beginners to adopt steps that are relevant to their situations and omit unnecessary steps.

3. Commercial advantage: Consumer decision making process is also considered in the arrangement of elements in this format. According to Butkevičienė et al. (2008), a purchase intention usually triggered after consumers recognize a need or a want. In this case, placing the brief description and possible outcomes of a flowering plant at the beginning of each instruction allows buyers to efficiently find what kinds of flowers meet their wants. The second and third stages of consumer decision making are information search and alternative evaluation. Displaying resources consumers should prepare before gardening and displaying different flowers the same webpage helps them to gain a deep understanding of planting preparation for each flower and compare which flower allows them to make fully use of their advantages. Additionally, purchase links are displayed after the “what you might need” and before planting steps. This is because viewers are more likely to make their purchase decisions after they gathered adequate information about a product. Additionally, consumers conventionally read instructional steps after they purchased a product.

4. No alternative displaying: Different from characteristic-oriented format, if elements for a specific section cannot be found, no alternative will be displayed. As guides to consumers with interests but limited knowledge in gardening, conciseness and clearness should be prioritized. Otherwise, beginners might be bewildered by the unnecessary display.

#### Editorial Choices:
1. The information on the header and footer is excluded from both formats because they are is less relevant and can be easily found if customers enter the main page of ufseeds.com.

2. The last section of advertisement in the original materials is also excluded. Instead, the descriptions along pictures in each material are displayed as purchase links, as the picture descriptions are more concise, and they also contain links to the website.



## Review:
1. Adding the link to the XSL file in XML file is only needed for testing the transformation in a browser before committing to the process. It would be simpler to include them both and then comment out the one that is not immediately needed. Oxygen associates them for generating the output files. Having duplicate files increases the possibility for error.

2. There are a few typos issues.

3. It would be better if I build an index page to pull these two pages together into the simple website. An alternative would be to have 'instructional' as a landing page that links out to 'characteristic'.

4. I should have also included DOCTYPE so that it outputs in the HTML. 


**Contact:** Please email any questions or suggestions to: chen.bailey@outlook.com

## References:
1. Bański, P., & Witt, A. (2018). Modeling and annotating complex data structure.
In Flanders, J. & Jannidis, F. (Eds.), The Shape of Data in Digital Humanities [eBook edition] (pp. 217-235). London: Routledge, https://doi.org/10.4324/9781315552941

2. Butkevičienė, V., Stravinskienė, J., & Rutelionė, A. (2008). Impact of Consumer Package Communication on Consumer Decision Making Process. ENGINEERING ECONOMICS. 1(56), 57-65. Retrieved April 26, 2020, from: http://www.inzeko.ktu.lt/index.php/EE/article/view/11661/6341

3. Mahony, S. (2020, February 27). XML Schemas [Lecture notes]. University College London. https://moodle.ucl.ac.uk/pluginfile.php/562662/mod_resource/content/4/schemas.pdf

4. Jervis, M. (2002, November 26). XML DTDs Vs XML Schema. Sitepoint. https://www.sitepoint.com/xml-dtds-xml-schema/

5. Tennison, J. (2002). Beginning XSLT 2.0: From Novice to Professional. Berkley: Apress.
