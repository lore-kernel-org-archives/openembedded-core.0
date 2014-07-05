Return-Path: <sadlife1990@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B3757020E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 08:42:21 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id oy12so2411535veb.27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jul 2014 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ZMFz6rfSWJlk2rzOl7isfkaeX4HFK6zjl13bo0vdPPA=;
	b=NwGpyMaZf/S9DAza8XbXgPsqfH9OlEmt1nxeUEKPA+GDSSfDmQiakrgQZWjTPEAG+w
	ue6uQ2Dt8T6kbHxKpO5PSpY5TZVlaOT0eD5bvJjn5fmDV3UhAINdl6FZvcxwVA5/StL3
	47hBFfT+BM/mc51hPbE9zS4V3BR6UrZkuVEITB59TA66sKWYEsS6dBrWgIrNBtDxqiKA
	lgHZPMWpWw/1VBmG9FM5J9xj62app7Jmn/b/NoW6Tms++4zVL6r/SPCQsUK3RtvwMEqR
	RE1qYLoUeIqqO9LD1fdMz2h1eg6rkUf6xmyZvusvfzz8are/65q0yTOJst68NRzOTGxg
	/j+A==
MIME-Version: 1.0
X-Received: by 10.58.245.134 with SMTP id xo6mr14419823vec.14.1404549743008;
	Sat, 05 Jul 2014 01:42:23 -0700 (PDT)
Received: by 10.58.152.200 with HTTP; Sat, 5 Jul 2014 01:42:22 -0700 (PDT)
Date: Sat, 5 Jul 2014 11:42:22 +0300
Message-ID: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass
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
X-List-Received-Date: Sat, 05 Jul 2014 08:42:23 -0000
Content-Type: multipart/alternative; boundary=047d7bd6ad8880638b04fd6e38cb

--047d7bd6ad8880638b04fd6e38cb
Content-Type: text/plain; charset=UTF-8

Hello,

I'm trying build simple image and I run this command bitbake console-image
After I see this error. How to solve this problem ?

ERROR: ParseError at
/home/setup-scripts/sources/openembedded-core/meta/classes/image.bbclass:1:
Could not inherit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass


Thanks

--047d7bd6ad8880638b04fd6e38cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br><br></div>I&#39;m trying build simple image=
 and I run this command bitbake console-image After I see this error. How t=
o solve this problem ?<br><div><div><br>ERROR: ParseError at /home/setup-sc=
ripts/sources/openembedded-core/meta/classes/image.bbclass:1: Could not inh=
erit file classes/rootfs_${IMAGE_PKGTYPE}.bbclass<br>
<br><br></div><div>Thanks <br></div></div></div>

--047d7bd6ad8880638b04fd6e38cb--
