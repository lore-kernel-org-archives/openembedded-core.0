Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9CEC660668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 12:09:47 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id kw10so3657726vcb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 05:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=izLz2Tk+lG+Y8zJHBqskaJMdVkOjmLVeoAgnownpNiI=;
	b=QcMdpVxYeNsU0ukjmji+p7scoVl0CApwGRJLoAqF/jnI7kfW5haxsHWmdkiyUxykS7
	KtKuD+JZPYAWx/trtFZs9GJeRFdgK0VcqoWI2ZLZkKAJ7fmtduJ7BYvAzetkhR8peFgf
	eI6SVDvJQoYjpS54K3lqaPbQwS5H8EzIGbK3vabsZg0mTpKvlEpuNrU8Cst35EMxc+ef
	y5d5xtQdvNWX8HVQQLb9i5q45owrgnl+2QIlygg79/xG8RySPsvTAMpxcd359kyT/jbj
	lajLhv0eOFQ5zjPSuaQvugubSrir1xzrb/E/+rjxKW1jdEpYqjCPxgJV67XaBV9Xw5rA
	zWaA==
X-Received: by 10.220.1.9 with SMTP id 9mr531949vcd.37.1371643788401; Wed, 19
	Jun 2013 05:09:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 19 Jun 2013 05:09:28 -0700 (PDT)
In-Reply-To: <4eb86c7d04788a85aa2c8c2244b9c69514decd92.1371642926.git.kai.kang@windriver.com>
References: <cover.1371642926.git.kai.kang@windriver.com>
	<4eb86c7d04788a85aa2c8c2244b9c69514decd92.1371642926.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2013 13:09:28 +0100
Message-ID: <CAJTo0LahxDK1h+h8NZOM2ctm9q4Bo63CHgCMH0=iW9_BZu8z2Q@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQmHgJMkRrxqC9wD05sTlPFASPNjcy4oSUtjneJsOSYBf0dpBOqtipEqbUDrfuOCKTYcfneP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] python-pygtk: fix parallel compile issue
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
X-List-Received-Date: Wed, 19 Jun 2013 12:09:47 -0000
Content-Type: text/plain; charset=UTF-8

On 19 June 2013 12:57, Kai Kang <kai.kang@windriver.com> wrote:
> +Upstream-Status: Pending

This is clearly an upstream bug, please submit the patch to bugzilla.gnome.org.

Ross

