<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : users.xsl
    Created on : 26 May 2017, 2:39 PM
    Author     : Kieran O'Brien
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="users">
        <html>
            <head>
                <title>users.xsl</title>
            </head>
            <body>
                <table>
                    <thead>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>DOB</th>
                        <th>Privilege</th>
                        <th>ID</th>
                    </thead>
                    <tbody>
                        <xsl:apply-templates />
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="user">
        <tr>
            <td>
                <xsl:value-of select="name"/>
            </td>
            <td>
                <xsl:value-of select="email"/>
            </td>
            <td>
                <xsl:value-of select="password"/>
            </td>
            <td>
                <xsl:value-of select="dob"/>
            </td>
            <td>
                <xsl:value-of select="privilege"/>
            </td>
            <td>
                <xsl:value-of select="id"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
