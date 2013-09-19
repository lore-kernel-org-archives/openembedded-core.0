Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f53.google.com (mail-vb0-f53.google.com
	[209.85.212.53])
	by mail.openembedded.org (Postfix) with ESMTP id D653360135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 13:45:50 +0000 (UTC)
Received: by mail-vb0-f53.google.com with SMTP id i3so6562578vbh.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 06:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JvbEP2s0KDlUcTE13YqZS53AaaDa1HcdDE72t0160ag=;
	b=cpYIKWIBauwh+Iob5lBlfg7MyeeUqWWfSMAFgWmArodZorHYmZU+fpAy3RdU71/41U
	1+ZBo8dPeZKSgFX25hxHW1JzcVOpD9fX42jYP6V+kyE+z1lIkUvS/wWFlpLFZSxNMF8C
	3AfORJQE21OAulHMDjRxOl7HstDJzKN0bHIP6oJpisUbAU+Yzmpspv8pz+dhtFYCVv+q
	MhH9N20QSFtxjUhVXn5gkjbLKI+Hgc+mazRMuxayhhMBPeZtGTe82wYaLsYe8OAQxY/Q
	QfggIeLJPTH7PBO+sHosKCIBQ8kdhU+SihllCJ2vmfXCLRU/tvm2N4p9Y7niVnXRvZqa
	Hlpw==
X-Gm-Message-State: ALoCoQlAVXBT7QKux0FHgRsMxC6HObZqswvzXKhKGqPJAItF5hQouvZXEzAfls10osYTwB522tVJ
X-Received: by 10.220.181.136 with SMTP id by8mr1290616vcb.11.1379598352423;
	Thu, 19 Sep 2013 06:45:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 19 Sep 2013 06:45:32 -0700 (PDT)
In-Reply-To: <523AFF14.10400@linux.intel.com>
References: <1379595133-5812-1-git-send-email-muhammad_shakeel@mentor.com>
	<1379596189.18603.115.camel@ted> <523AF9CB.5040600@mentor.com>
	<523AFF14.10400@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 19 Sep 2013 14:45:32 +0100
Message-ID: <CAJTo0LbpiFKwHaPUnp5Lzpum6FxCuJzpryu5gSsFeR3geVj=4g@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: Upgrade to v1.18
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
X-List-Received-Date: Thu, 19 Sep 2013 13:45:51 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2013 14:41, Jukka Rissanen
<jukka.rissanen@linux.intel.com> wrote:
> ConnMan 1.18 release notes can be found here
> https://connman.net/blogs/patrik/2013/connman-118

<standard moan that connman doesn't do stable point releases here>

Ross

