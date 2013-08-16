Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id A78F26B79C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 11:40:19 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so1909044pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 04:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=8DvQBCXKpQT5OmbRMH5Vd5KLDLaDpi+HLXGG4+g5tuI=;
	b=gljemoXcBWqRngsSXqDBGc5aVqM0kZ5ybFeo+3jnfXpX6uEDM4i7w7Ytx+Ibvjq+ao
	6UmtRC6P5A/jSO9249reZBcIPT9PXrFStdxmG+x5UK77kesh4LAb3Xr9Ne/LhujNe7qt
	fKL9UeH34rwYxaa5lD8Yxk2O/PNO8nQVRfv9I3HHMPB8v68ebnuy1xL1s0X2B7l6jE2t
	9QM+cQe+WwHDoyc2/rxUxMc+zmFIwiolZGRCZs6bB1+2QEmVKke6M22pDSvNqMdlYxft
	k6WnDQH7pzXVCBYzeYwLyzMQqpV14eEZsbzPyjZoefv/2UJ5QyLcytELfHbwHcv+Cpv6
	wxNQ==
X-Gm-Message-State: ALoCoQmlCvGVG7icCFWguMnPz5Y9P1fF2hpPkZEOl2wKwi/DVGryjpv3N9FJGwrNtCkcw6bQcsH8
MIME-Version: 1.0
X-Received: by 10.66.118.204 with SMTP id ko12mr1044149pab.184.1376653220310; 
	Fri, 16 Aug 2013 04:40:20 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Fri, 16 Aug 2013 04:40:20 -0700 (PDT)
Date: Fri, 16 Aug 2013 12:40:20 +0100
X-Google-Sender-Auth: kbYgfiP0Fqm-fxZka5O2VzRV03M
Message-ID: <CAOMwXhNaMEvSfi-J=EPOXfSAfjWUJeq8pGAGE3_5Hix1Sw9mKg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Why is "bitbake core-image-minimal" building gtk docs?
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
X-List-Received-Date: Fri, 16 Aug 2013 11:40:19 -0000
Content-Type: multipart/alternative; boundary=e89a8ffbaa2b2cffe404e40f0ef1

--e89a8ffbaa2b2cffe404e40f0ef1
Content-Type: text/plain; charset=ISO-8859-1

Hi,

alternatively: is there an option to turn gtk, especially the docs off?

Cheers,
Laszlo

--e89a8ffbaa2b2cffe404e40f0ef1
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr">Hi,<div><br></div><div>alternatively: is there an option to turn gtk, especially the docs off?</div><div><br></div><div>Cheers,</div><div>Laszlo</div></div>

--e89a8ffbaa2b2cffe404e40f0ef1--
