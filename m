Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id C68AB77155;
	Fri,  9 Sep 2016 15:52:19 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id 1so40668291wmz.1;
	Fri, 09 Sep 2016 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:from:date:message-id:subject:to;
	bh=EpOXGEIw4YjKuV5gBAeA9jLRbzf3dGSsyXvOxJTR3Yk=;
	b=hPW8WOku+Hirvj/U8acLMtPBWx8KDxml13kYnz9YnHBez9PD4Ybw/wA0eXzbDjQBvI
	uaXOij4aG6PHcumEOUkzyx/TY4dXygi8cpTDH6IbTVJGe7dKekv+13TWYn6+/a0Ug63t
	hNbOy7JBXYAbhIFAW8sMdAZwuq+g34LmM5M1SpJiFf0rGYA69laROBfN78f+DQIVJXcs
	zN9ub32g9NQkavwn68Mcowh5WpraZdn9XZ5hH3mjgAg3dAJd4Tcx8kG5W+SGRQTdpiU5
	/3kGGobXdS5tK0tMMEkaD2lWFdZdUtKOFd3XVmChtkDVaMawg3YuJwsuNgmwhSe1FiLK
	Ps8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
	:to; bh=EpOXGEIw4YjKuV5gBAeA9jLRbzf3dGSsyXvOxJTR3Yk=;
	b=RouE+BIg6HIGGfEc9WvfWZzx6cqpXMya+pD+6bvFUxNTBJMHN2Uxx5l+FImA9SanOO
	8IBNTbtP4jOSWDv3wkpCBqFGrzBsEsc0d8tRqAvTYjRYHP0XrT+ErL5rg46x6uwHcLtB
	7fJpk3KHzd391Uw3z848p6gYwtM//NlYbP0KBv9Ci78WAUMKhVyMyqhPITkVWLM+984o
	BBFmuHwcbCVBLCLCKqoJrkf+cW6qWUi6aOK7GvQHptHztnU75JAzFwL2MIKfJ4kfUjdy
	2divEFTOXnWN6UL+B/OkX85N71JRfgoqVhAZ6mCnbYjIT4nePuf5Ivtwg7oqNwZ29aNE
	J2ag==
X-Gm-Message-State: AE9vXwPsrjRsJHOjEDSRyGZeFZrOijsdhNLgScifGN7Uh6qzIlJ60fScX8+yH78Im1o817nr0VQvkkoPG3aaAg==
X-Received: by 10.28.210.82 with SMTP id j79mr3595847wmg.10.1473436339743;
	Fri, 09 Sep 2016 08:52:19 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.80.151.3 with HTTP; Fri, 9 Sep 2016 08:51:59 -0700 (PDT)
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 9 Sep 2016 08:51:59 -0700
X-Google-Sender-Auth: _iJVvli7RuiSow6apjrsf80cWRo
Message-ID: <CA+YB3raLEFHAECfBVAspQni9fG0_X0oTPM-Z_F64FzV6PuNdUw@mail.gmail.com>
To: Yocto Project <yocto@yoctoproject.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Subjects for YP Developer Day at ELCE
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
X-List-Received-Date: Fri, 09 Sep 2016 15:52:20 -0000
Content-Type: text/plain; charset=UTF-8

Hi all - we are in the planning stages for DevDay at ELCE right now,
particularly the advanced track. This track changes every session,
usually to cover the things we are working on hardest - for example,
in San Diego we covered CROPS, devtool, the latest Toaster features,
and much more.

Whether you are able to attend DevDay or not, we would be grateful to
hear your suggestions for subjects to cover in the advanced track. We
are currently planning talks about CROPS, devtool and the ESDK,
Toaster, wic, smack, security, and a few other things. If you have a
burning desire to hear about something specific, please let us know.

Also, we'd love to see you at DevDay, here's the link:

-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

