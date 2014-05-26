Return-Path: <wills.wang.open@gmail.com>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 May 2014 03:47:36 UTC
Received: from mail-pa0-f53.google.com (unknown [209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id ADEBC65FFC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 May 2014 03:47:36 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id kp14so6928474pab.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 May 2014 20:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=HiizQIXNCDJ6OzC+xwyysNNUFWSFzsFGA11ZhQjrYoQ=;
	b=r50AJEkvDX73rqqeHhYt221E3boE5oMNagxr8zM+pyc/duaD6MMqnur75l+nzxErLy
	20jK1Au3deukCR1nycqaDSvTEY2/v8aDdZ9lgbBlYlemMqPuy0Bte0DNahGP0/9uMTTz
	Bc245MvVfQ8AiX3jrVBQlCsCvEHISYS7t8Z50i5Vv9J3oI3SKxR2Hs8BslL2JSFExiTs
	nBdl4GSglxclmfbHAE/0Yu16tcvF61eivuSNkDSXqFVCGHTvf2vUbXyIJGOBcmTbiAsp
	4LPlmTDdjhQ4lfC6noFVNDJqjYdFNLHkMIyiKwCzdB+1zM4Cy/D+AQopOasR02NB1is+
	aPGg==
X-Received: by 10.68.164.229 with SMTP id yt5mr24691505pbb.28.1401075603129;
	Sun, 25 May 2014 20:40:03 -0700 (PDT)
Received: from [192.168.10.16] ([183.16.38.82])
	by mx.google.com with ESMTPSA id
	io6sm51593591pac.44.2014.05.25.20.40.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 May 2014 20:40:02 -0700 (PDT)
Message-ID: <5382B78B.8020200@gmail.com>
Date: Mon, 26 May 2014 11:39:55 +0800
From: Wills Wang <wills.wang.open@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: How to use SDK/ADT to generate the ipk/rpm/deb file?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 03:47:36 -0000
Content-Type: multipart/alternative;
	boundary="------------050809020507000203000603"

--------------050809020507000203000603
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I want to use SDK/ADT to develop application, but i don't find anything 
about how to generate the ipk/rpm/deb file after compiling.
Is there any way to do this?

Best Regards
Wills

--------------050809020507000203000603
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi,<br>
    <br>
    I want to use SDK/ADT to
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <span style="color: rgb(51, 51, 51); font-family: Verdana, Sans,
      sans-serif; font-size: medium; font-style: normal; font-variant:
      normal; font-weight: normal; letter-spacing: normal; line-height:
      24px; orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: auto;
      word-spacing: 0px; -webkit-text-stroke-width: 0px;
      background-color: rgb(255, 255, 255); display: inline !important;
      float: none;">develop application, but i don't find anything about
    </span>how to generate the ipk/rpm/deb file after compiling.<br>
    Is there any way to do this?<br>
    <br>
    Best Regards<br>
    Wills<br>
  </body>
</html>

--------------050809020507000203000603--
