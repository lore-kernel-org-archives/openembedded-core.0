Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 85DAF6B201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:30:01 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so325360vbg.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=jMlqLQuFW2m8PVuu+pSQeR+6XY0tb0bfFLWhcYiFKAY=;
	b=XPUBjdqP+zyXwGvF/a3aaH9QOkLdNXi5FAzTV3XJ2fz/6B8HA5/aM7TAmXih44UGqy
	4atfG9253jIlqrgVFzT2lVBEuEDh2tCIIow7mi+inKhDYksIa6MDJgeCM1IG38VZTwFz
	2NenL4QvkyICsj77tnvtWq53IxgmC3tP7qFTx//4OUFSIzq4EWyXyrRHo1DExtB1wk9O
	OF1C1Ho0YN4wM9cpvxjWGaTvyH+WYWjGcQQB2IhLwOdKNkNExGED1q0WFN9fKXoBzyUA
	caU/ki9newHT6g5pPmmrV5S3jd4Yb5vj1dHDHjtkky7WnN3cP464fdNqNtP4llaP8x2U
	wCPw==
X-Received: by 10.220.58.195 with SMTP id i3mr248642vch.38.1373970602140; Tue,
	16 Jul 2013 03:30:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 16 Jul 2013 03:29:41 -0700 (PDT)
In-Reply-To: <cover.1373958076.git.sgw@linux.intel.com>
References: <cover.1373958076.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2013 11:29:41 +0100
Message-ID: <CAJTo0LZqDrcpSKVm1qXyzebRX9wOC_urTHaaeGWPJA=h-GLpZg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlJnUGUFeMv8FY0wgl3l1ymdXPRMhYDYIDP0JeDtQ7zToamoNMhC+SxIY54SyQkXiLZyUM0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/28] Updated C-Pull needs review
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
X-List-Received-Date: Tue, 16 Jul 2013 10:30:02 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2013 08:14, Saul Wold <sgw@linux.intel.com> wrote:
> The following changes since commit 43c28375f97161e618fa54349c65be2058c33c53:
>
>   distrodata.bbaclass: change in git and svn package reporting (2013-07-12 10:12:13 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage2

Acked-By: Ross Burton <ross.burton@intel.com>

