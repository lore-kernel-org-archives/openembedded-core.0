Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail.openembedded.org (Postfix) with ESMTP id A88147FF0D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:03:02 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id a15so3688957otf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=xAdz4m9SmQDPtyrqWNFCqAau84xtRhudCQV5GMwK97M=;
	b=d9zcj6XsHgY6yrcdgcCZJyKhl3uTjhAVecUbAzBLvNfdeawoAOcqj2/twZFzBvm+ha
	8Y89vQxCHSQlE75G9+PTr2bMxdwfMcnfuovZmYuKnpVbqJxkPN35nj1ulBmIx5IiYYlF
	s1C1oIRTSUprGqaILv55AtHu9RjUY0+8reLa4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xAdz4m9SmQDPtyrqWNFCqAau84xtRhudCQV5GMwK97M=;
	b=Stv+eI+FKhviQJh34y3UIuxTmMNe2QuXoD5l5sqlZtgV37e3PTQO7oIA08ABDrl5RQ
	0zcNfFyFHmaahOQtKOVDGlPtSXs6hTPY2T0ioAuDIYXgnMFWQhpZSNaDq+0RhIo6hB1t
	DfdOmM0vhDI99DE5IKbqVRhV9L9kxdVG4qy3wttbMO8eMuJEJaCVH04ULmseB+8xSvbf
	TlKY+5wGwgd/LbvjazdKk+mKXRsIEWsXvrZy5qJ5Z4QJV9z3hFajtWebSqSc8XZVnQwI
	IqXzZNwi6xLgUC5WgzcXn/03JuVdCaojM1UVqG3IiqaL1u04bG+uFoSxC9d5MzxmJgsA
	XdkQ==
X-Gm-Message-State: APjAAAVsR4ugxaN2ApPGsltMilVww7iD8IJ84Ku2t+zqF0S4DM1d0EG+
	141UT0dWsG6IWAY2SFNApH+/feHTcu/peJ8HJ+Cd23Dgx9gFI6Km
X-Google-Smtp-Source: APXvYqw0RjOSeB+t7kXdCB0OQepdxdGYfnhKF6cdVJQKjwf2+2kHC8YFvargsye4HtygnoTvKRtuGjA/Z2wGSPt0M78=
X-Received: by 2002:a9d:470a:: with SMTP id a10mr4373006otf.370.1578492183360; 
	Wed, 08 Jan 2020 06:03:03 -0800 (PST)
MIME-Version: 1.0
From: Paul Barker <pbarker@konsulko.com>
Date: Wed, 8 Jan 2020 14:02:53 +0000
Message-ID: <CAM9ZRVvru2LaypQk337KMmT1DsxRAuA4-9peU21PSMRf2o43Hg@mail.gmail.com>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: OpenEmbedded at FOSDEM 2020: Request for volunteers and demos
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
X-List-Received-Date: Wed, 08 Jan 2020 14:03:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hey folks,

We've got a stand for OpenEmbedded at FOSDEM 2020
(https://fosdem.org/2020/stands/). For anyone who hasn't been to
FOSDEM before, it's the Free and Open Source Developers' European
Meeting at ULB in Brussels, Belgium on Feb 1st and 2nd. FOSDEM is free
to attend conference with dozens of stands, hundreds of talks and
thousands of attendees. I highly recommend coming along if you're able
to!

I'll be able to look after the stand for most of the weekend but will
need some assistance and some cover so that I can take breaks when
needed. I'm looking for volunteers to help with the following:
* Setup from 09:00 on Saturday morning.
* Running the stand and discussing the project with attendees from
10:00 to 17:00 Saturday and Sunday.
* Tidy up from 17:00 on Sunday.

I'm also looking for demos that can show off the project. I'll have my
laptop with me to show toaster, the layer index, how builds work, etc
but I won't be bringing any hardware devices as I'm travelling on
after FOSDEM. We'll need a couple of hardware demos to show off the
project well. The table is 180x80 cm.

If anyone can print up some flyers with info about the project that
would also be excellent.

Thanks,
Paul

