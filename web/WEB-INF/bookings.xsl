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
    <xsl:template match="bookings">
        <html>
            <head>
                <title>Booking</title>
                <style>
                    table.format {border: solid 1px black; width:100%; }
                    table.format td { border: solid 1px #999; }
                </style>
            </head>
            <body>
                <h2>View Bookings</h2>
                <table class="format">
                    <thead>
                        <th>ID</th>
                        <th>Flight ID</th>
                        <th>Booking ID</th>
                        <th>Origin</th>
                        <th>Destination</th>
                        <th>Flight Type</th>
                        <th>Departure Date</th>
                        <th>Return Date</th>
                        <th>Description</th>
                    </thead>
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
                <xsl:value-of select="flightID"/>
            </td>
            <td>
                <xsl:value-of select="bookingID"/>
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
                <xsl:value-of select="departureDate"/>
            </td>
            <td>
                <xsl:value-of select="returnDate"/>
            </td>
            <td>
                <xsl:value-of select="description"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
