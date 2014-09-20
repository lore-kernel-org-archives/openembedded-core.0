Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 272C670FAB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:27:52 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id c9so1289548qcz.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FXNYTgAbkBXY35/7+l/lO0C9ZFgbqGzCx0ZWS8LpqaY=;
	b=TyLUjxEV1lWerTsBwqHzBFHuVghZHk6KrcRMab0Bf3qCi8HmENd3adk9Z31XagqeE1
	Olay9lkWxLFZzcHqBKzHUX6uqbJRWshOI7TRmt1ysluTK5jzJcVaTuGjMJKe8daXb7cr
	XvwvowERBVjtgjZx8KN/qENAYInIfrst8K5UwvRR4M1TjKe8c/QMvzeJhmyEoyyzWpC8
	HhAtiR7KcS0UIewnPre+8TqRU4Bd1OaTQvwdOQLeVhebng1opc2oKqb4AbM2Pl9J+cez
	MWO+Myxqh+nT7/rtGmaG8DI+3l7CW+CBxZuiCMgNCtzq4MU5XkItRQP0ky5TKpGziiuw
	2A3A==
X-Gm-Message-State: ALoCoQnYNTMux6Ocuo2SMRuVXc98ht3Ht7e1G2sfl0dNdGVguPKzOnm6Q/tli+lxk9iLrSVj/YrO
X-Received: by 10.224.103.65 with SMTP id j1mr5194890qao.17.1411172868994;
	Fri, 19 Sep 2014 17:27:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 17:27:28 -0700 (PDT)
In-Reply-To: <20140920001156.GA2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<CAJTo0LbGHQEa_QjRnekh8L+-+kAn575K3jFJ2ypty-EDkKS6RQ@mail.gmail.com>
	<20140920001156.GA2480@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 01:27:28 +0100
Message-ID: <CAJTo0LYdoVWcE8Q7QfGasFG4eY=iejCcHhoRty_b8Ov7NJnjYQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] u-boot: cleanup indentation and consolidate .inc file
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
X-List-Received-Date: Sat, 20 Sep 2014 00:27:59 -0000
Content-Type: text/plain; charset=UTF-8

On 20 September 2014 01:11, Denys Dmytriyenko <denis@denix.org> wrote:
> Yes, it's outdated and rather misplaced...

Thanks.

Ross

