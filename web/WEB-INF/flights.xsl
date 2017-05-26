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
    <xsl:template match="flights">
        <html>
            <head>
                <title>Flights</title>
            </head>
            <body>
                <table>
                    <thead>
                        <th>Departure Date</th>
                        <th>Return Date</th>
                        <th>Price</th>
                        <th>Number of Seats</th>
                        <th>Origin</th>
                        <th>Destination</th>
                        <th>Flight type</th>
                        <th>Flight ID</th>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="flight">
        <tr>
            <td>
                <xsl:value-of select="departureDate"/>
            </td>
            <td>
                <xsl:value-of select="returnDate"/>
            </td>
            <td>
                <xsl:value-of select="price"/>
            </td>
            <td>
                <xsl:value-of select="numofSeats"/>
            </td>
            <td>
                <xsl:value-of select="origin"/>
            </td>
            <td>
                <xsl:value-of select="destination"/>
            </td>
            <td>
                <xsl:value-of select="flightType"/>
            </td>
            <td>
                <xsl:value-of select="flightID"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
