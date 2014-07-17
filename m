Return-Path: <sadlife1990@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id F3BD66AC74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:12:12 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hq11so2425376vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 02:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=yvkxf70YSPDdDl3AlHhzXcGY2/N7wIvhgJL1vK4Q6mc=;
	b=mMGZ5OENGlz4JBuxGJngFVhHZxEJTLHz19NSUWFbHXR4sG6hE1ft+mPq305wxzjYX0
	vFB0X8B+5GfmfSSjzGAZBz+CjxDMgb6xr7IhHrwb+ENmPJK/e1wvJ1POvjGOINFtqiXk
	0fhEE2FzjC92mhkXbyBR89sqVgxCr/r/re8HJAc1PsTSkK8ZHddz2JJnerCe2yeuMZlr
	dwb4Sm/AR7Lur75TBr2qBhgzWSn3bxO6ZlElElz9cgngKUdc59Z3tmUK+YISQkQT30fw
	zivfh2ktq99cHsHrljCe+oO7cLbjZBuE2m51S0Yf+POPwrci+7rhvZHR59lQBtbJwUmf
	S6ZA==
MIME-Version: 1.0
X-Received: by 10.220.69.68 with SMTP id y4mr36850161vci.21.1405588333552;
	Thu, 17 Jul 2014 02:12:13 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Thu, 17 Jul 2014 02:12:13 -0700 (PDT)
Date: Thu, 17 Jul 2014 12:12:13 +0300
Message-ID: <CAAHuHfw=AgZ-e62eLtRKZMcNBTdzZcjZY+MOA_OirYmbTUEQKw@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Missing or unbuildable dependency chain was: ['console-image', 'eglibc-gconv']
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
X-List-Received-Date: Thu, 17 Jul 2014 09:12:17 -0000
Content-Type: multipart/alternative; boundary=047d7b3a92525269cd04fe600955

--047d7b3a92525269cd04fe600955
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying minimal image but I see this error Please give me advice


NOTE: Runtime target 'eglibc-gconv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['eglibc-gconv']
ERROR: Required build target 'console-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['console-image',
'eglibc-gconv']

Thanks

--047d7b3a92525269cd04fe600955
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br><br></div>I&#39;m trying minimal image=
 but I see this error Please give me advice <br><br></div><div><br>NOTE: Ru=
ntime target &#39;eglibc-gconv&#39; is unbuildable, removing...<br>Missing =
or unbuildable dependency chain was: [&#39;eglibc-gconv&#39;]<br>
ERROR: Required build target &#39;console-image&#39; has no buildable provi=
ders.<br>Missing or unbuildable dependency chain was: [&#39;console-image&#=
39;, &#39;eglibc-gconv&#39;]<br><br></div><div>Thanks<br></div></div>

--047d7b3a92525269cd04fe600955--
