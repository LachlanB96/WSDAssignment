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
                <h2>View Listings</h2>
                <table class="format">
                    <thead>
                        <th>ID</th>
                        <th>Flights</th>
                    </thead>
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="booking">
        <tr>
            <td>
                <xsl:value-of select="id"/>
            </td>
            <td>
                <xsl:value-of select="flight1"/>
            </td>
            <td>
                <xsl:value-of select="flight2"/>
            </td>
            <td>
                <xsl:value-of select="flight3"/>
            </td>
            <td>
                <xsl:value-of select="flight4"/>
            </td>
            <td>
                <xsl:value-of select="flight5"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
