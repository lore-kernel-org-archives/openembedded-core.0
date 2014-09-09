Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5365D712EC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 11:41:44 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id i50so2665425qgf.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Sep 2014 04:41:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=b3PQkQ1P+EFYQ+CTVGIEavAl7WfijL7UL+8oKyAY3OE=;
	b=Eandi+wW0U2ChLQTgB2Vfx61fTdcacLR7SiALBNZqGPSPktehI5ZDiEJd28+9tua/5
	TpMXvYQuF+/AnScf8tQnIOogA6/Y8bGW1oy5ZJU4xpUXbuvpA7oatm1kciwCdB8y2ACm
	kCjUkIGnoBu+yBoeUKlIxgwALFE+ZrRQpmjmgXh3En0/gBLME7xm52G1xomkR6KcZSig
	thP7O0JUJIKRntQq43sFXHtjLFc/DZWPSd9/zwx5fpP7WI2RKYz65Wjp1qbe3SJoxOj/
	YFE4hkizseNyjR1cVils9AFwuwH/jH3wIHQiK5Xw1eysgtKBtm9MbOROUH0DdQdnt/cQ
	u9oA==
X-Gm-Message-State: ALoCoQlIt+s2ofN9ib2qiD8NE+lN2K+6GsdVmtGzg0fOb2ba42dPchlvyKQxtqjNzCFb372G8IG5
X-Received: by 10.140.94.234 with SMTP id g97mr48444202qge.77.1410262905899;
	Tue, 09 Sep 2014 04:41:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 9 Sep 2014 04:41:25 -0700 (PDT)
In-Reply-To: <4acec69d24f74514f78156cb21ed8e0f57e89532.1410205901.git.bruce.ashfield@windriver.com>
References: <cover.1410205901.git.bruce.ashfield@windriver.com>
	<4acec69d24f74514f78156cb21ed8e0f57e89532.1410205901.git.bruce.ashfield@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Sep 2014 12:41:25 +0100
Message-ID: <CAJTo0Lazy6B6qiin8ta-o-va093Z9tRpG17BNL=hX2bnPtYo1g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/7] perf: fix v3.17 powerpc compilation issues
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
X-List-Received-Date: Tue, 09 Sep 2014 11:41:45 -0000
Content-Type: text/plain; charset=UTF-8

On 8 September 2014 20:55, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> Unitl fixes get into the mainline kernel, we temporarily fix the issues by

"Until"

Whilst you're fixing the patch headers in the other commit, you can
fix this typo. :)

Ross

