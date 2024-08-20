Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEC8C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:45:18 +0000 (UTC)
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
 by mx.groups.io with SMTP id smtpd.web11.12685.1724136314320041355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=Zqt2zXBs;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.162, mailfrom: andrej.v@skyrain.eu)
Received: from [172.25.231.43] ([85.248.43.180])
	by cmgsmtp with ESMTPSA
	id gIcBs5vGz4k5vgIcBsJdRs; Tue, 20 Aug 2024 08:45:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1724136312; bh=s5pjzJhKLOxRUb2auHtNjdWufIiLLTGFzuSOaMQErdA=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=Zqt2zXBspGSZ01Khe9UsiXwekdZ/3U4mJDUx0lR/zuYrCUxyZscDjPyAdj7ssQFjt
	 tIqKOtQc3Q4BNyF4dqdYrWfLdBcdtal7Ojhwl/A2iTZ8LflTicZarBeLuM5gOgi+eR
	 xixFAnAl+7KHefzItZtcvZ8tvXYlvCSDZxEAQs/M/ll+0zCIeB8NbNr1uw0Hx/CL7U
	 p+EDBfwEssaHgtzConuo9OY2j0erb00VQ2eT1i/xcWZd01WSxX5vwwrQlmKTxgUdKX
	 tji2I8J1PJOLa3emdhSuhWqLSkKRN21HcCfD8DdRzewQJvSL7oGlgGxFE8VXlHDRfS
	 g5uDeA5zHyaKg==
Content-Type: multipart/alternative;
 boundary="------------JGBdS5wAXeAHqHaBh0f2ew1h"
Message-ID: <327ef345-67fa-4567-960b-0e3f44203683@skyrain.eu>
Date: Tue, 20 Aug 2024 08:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Expired certificate https://git.openembedded.org/
To: peter.marko@siemens.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-CMAE-Envelope: MS4xfGFpx5AGtQcOl2wHbJfQwTNtxMey6lTkuz2GKZcVctyIbApQ5nfeC8k3RA3MSB3KaGq0TnoghGlTX+hwu0s4+d3ocudg09nn3ntQ1WQzL4vV7ogqIpey
 jYNFH9sxzRZTxfhXFIn34Pi4kiK7XUvc+0OlRU8E2ITXGhO5alN0k2rc3jS9/n66C1nDqXY94vtQSIZG+f/dqtCLCGrNn5ixJ6srZUB+0IFVmuEafEAfHKMI
 J8byOIFejRlamApMxxbX+w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203522

This is a multi-part message in MIME format.
--------------JGBdS5wAXeAHqHaBh0f2ew1h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Now is even worst, server is completely down.

Andy

On 05.08.2024 15:15, Peter Marko via lists.openembedded.org wrote:
>
> In case no one noticed yet, the certificate expired an hour ago, so 
> the repositories can’t be viewed in a browser…
>
> Peter
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202992):https://lists.openembedded.org/g/openembedded-core/message/202992
> Mute This Topic:https://lists.openembedded.org/mt/107731343/3619876
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>

--------------JGBdS5wAXeAHqHaBh0f2ew1h
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Now is even worst, server is completely down.<br>
      <br>
      Andy<br>
    </font><br>
    <div class="moz-cite-prefix">On 05.08.2024 15:15, Peter Marko via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AS1PR10MB569783A5910EC551F00C7170FDBE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <meta name="Generator"
        content="Microsoft Word 15 (filtered medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Aptos;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}div.WordSection1
	{page:WordSection1;}</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="MsoNormal">In case no one noticed yet, the certificate
          expired an hour ago, so the repositories can’t be viewed in a
          browser…<o:p></o:p></p>
        <p class="MsoNormal">Peter<o:p></o:p></p>
      </div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#202992): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/202992">https://lists.openembedded.org/g/openembedded-core/message/202992</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/107731343/3619876">https://lists.openembedded.org/mt/107731343/3619876</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:andrej.v@skyrain.eu">andrej.v@skyrain.eu</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------JGBdS5wAXeAHqHaBh0f2ew1h--

