Return-Path: <paul.betafive@gmail.com>
Received: from mail-vb0-f46.google.com (mail-vb0-f46.google.com
	[209.85.212.46])
	by mail.openembedded.org (Postfix) with ESMTP id 06AB660135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:34:35 +0000 (UTC)
Received: by mail-vb0-f46.google.com with SMTP id p13so6429812vbe.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to:content-type;
	bh=8wZgan5qlkSq76FMvzCqS+DUNg1EU7unbEJRTBN+NiY=;
	b=gnl91Lp55PTx5LENpunpLZq+CW0SXqU7iGZ3yD/N7jSjDQS7ttkvC82ghrTbDPKChk
	9Lgf23m28ns9zndSsAZAif7aG28vDdW8rM7AGPozgEFLFhLYY90v/1+C4IsNr6FXg/94
	eWVvWtMdZFD3272DNpLa2L17HFe/SA6hIUc5UwJT8jXZmlX4izmjIo7rfCjPXdqGIj33
	sxnCqej/P2Vm09kFT1Pfw46j76E3cYe8vB5KHcRVrB3JrN1U1rMW7+/ftFEeBV3oPJWZ
	mcu3VWEsQdUbkzC76GACLFjpx8F8RJ6vo+gH0qBwJ+tvyIFB21dqf/WUSJnY6DlL8iXw
	KePg==
X-Received: by 10.220.97.145 with SMTP id l17mr204795vcn.35.1379597677452;
	Thu, 19 Sep 2013 06:34:37 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.109.72 with HTTP; Thu, 19 Sep 2013 06:33:57 -0700 (PDT)
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 19 Sep 2013 14:33:57 +0100
X-Google-Sender-Auth: tuHngvLjFeTJ4H37TCLw9SQABDk
Message-ID: <CANyK_8fTtdxWXPf9eSgpQWvvPspaashL14vi-h8x15FtJOQ0DA@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: RFC: Janitorial tasks
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
X-List-Received-Date: Thu, 19 Sep 2013 13:34:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

After discussions at the last TSC meeting I've merged the OpenEmbedded
wiki page for janitorial tasks
(http://www.openembedded.org/wiki/OpenEmbeddedJanitors) in to the
equivalent page on the Yocto Project wiki
(https://wiki.yoctoproject.org/wiki/Janitors). In addition to keeping
everything in one place, the benefit here is that the page on the YP
wiki can integrate with the YP bugzilla.

To quote the page: "[Janitorial] tasks are intended to help people get
started working with the Yocto Project. These tasks should not require
a lot of context. Anyone with basic programming skills, experience
working with Open Source software, and some time on their hands should
be able to complete these."

If anyone has any suggestions for tasks which could be added to this
list, please propose them in reply to this email or go ahead and add
them to the wiki in the existing format. It would also be beneficial
to add some hints and tips on where to start with the existing tasks
that are already on the page. Suggestions of who to talk to/what
mailing list to post on for each task may also be a good idea.

If you've previously posted tasks on the janitors page, now would be a
good time to quickly review them and ensure they're still relevant.

Any comments about the organisation of janitorial/newbie friendly
tasks in general are also welcome.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

