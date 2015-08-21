Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2A03473CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 01:37:38 +0000 (UTC)
Received: by igui7 with SMTP id i7so4340122igu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 18:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KQBcTnup6LWLWMVcHrCw+WrwBxogWSxIwWv4wv9en78=;
	b=Av0lyB2tixu4uNQ4Sgajnmz+kiidgcKs7MvjnfbUOykDjMIUL+ic9R2oEH9sazxERC
	VfEv6rBouLd00Iti22LyTv8lhzyH3KpTNSgiiEPNLFK+KtdHga67woksSKELZ3kQqoAk
	u07oS4iBzbCbpzUwIr8/FONCggjAd6HsWkS0A3yRZ7CO3B5MdGCcWDUrmyZAcCyukjVd
	x4sQx8BDwyLhlvemXIs5TadpamELF+O+WFr+Hy8tKrwQYj3h/Lxl1B0/tOyQ5k+rdxDN
	3KVXy8YtQO5V0SyZcth3LvTdzW505ZYht+DQvyuZgLldD9Po0BE3mzbFjctvWRELch8+
	bASw==
X-Received: by 10.50.119.33 with SMTP id kr1mr682994igb.75.1440121058866; Thu,
	20 Aug 2015 18:37:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 18:37:09 -0700 (PDT)
In-Reply-To: <51334.10.252.47.114.1440063585.squirrel@linux.intel.com>
References: <1440037356-937-1-git-send-email-raj.khem@gmail.com>
	<51334.10.252.47.114.1440063585.squirrel@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 18:37:09 -0700
Message-ID: <CAMKF1sr-smXp2HhP47ZzmAuFDfzuqMw9=Ba2+VboH2RPduY+0Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Fri, 21 Aug 2015 01:37:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 2:39 AM,  <alexander.kanavin@linux.intel.com> wrote:
> This will help anyone who will make changes to this recipe in the future
> and will need to find out why certain things were done in the past.

yeah, I have added pointers to commits instead.

Thanks
-Khem

