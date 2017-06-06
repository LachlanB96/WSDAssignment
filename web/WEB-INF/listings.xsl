<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : flights.xsl
    Created on : 26 May 2017, 2:50 PM
    Author     : Kieran O'Brien
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="listings">
        <html>
            <head>
                <title>Listing</title>
                <style>
                    table.format {border: solid 1px black; width:100%; }
                    table.format td { border: solid 1px #999; }
                </style>
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
