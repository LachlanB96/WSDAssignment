<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template match="listings">
        <html>
            <head>
                <title>Listing</title>
            </head>
            <body>
                <table>
                    <thead>
                        <th>ID</th>
                        <th>Flights</th>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="listing">
        <tr>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="flight"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
