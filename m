Return-Path: <andre.draszik@gmail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFFD60796
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 12:44:00 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id xy5so3741507wjc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 04:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mNFqzDHi2NExMF1F2vxXbZINSoBFIowBf7ZCFRGoX68=;
	b=j8urcAxCH7jyPk/hnir6PKJgvKrch8Stta/MyQc83GXF+YNeO1m2x59bBc5J141kTP
	qusnBXu+zl3535fdg+dFImNywb2I60VNMA0/iEPGze7E//w7bT8UnjU8k1y8REDsEzjZ
	y2VN4bFoBwcOiZRpYVYuXJ3Q417vGVWuqDAd31aKz3/02enA16eH9qiPQmbOtFasIUC0
	+kKR1bWITen7LgNgBaxDdJ9CMq3zV7RW4MZTvTjS2xneDfggEBno7AGxRS+jVxr7Ht27
	nSaE9WeUG+D30orAhWy2Q1OQCkx3EqdisqxOP+y/V9vneb43aO9kbXkB2RuokGUNCe8h
	qh+w==
X-Gm-Message-State: AKaTC01Q07qgFVo7n+xjd4teYUxAgQk2pXtOTu/iZCP9/0MIglTTOqUXiMmhpwjYG9cUCg==
X-Received: by 10.194.79.5 with SMTP id f5mr11363193wjx.13.1479732240815;
	Mon, 21 Nov 2016 04:44:00 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w18sm19362316wme.9.2016.11.21.04.44.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 21 Nov 2016 04:44:00 -0800 (PST)
Message-ID: <1479732239.18484.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 12:43:59 +0000
In-Reply-To: <1479730971-23120-3-git-send-email-maxin.john@intel.com>
References: <1479730971-23120-1-git-send-email-maxin.john@intel.com>
	<1479730971-23120-3-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] ofono: upgrade to 1.19
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
X-List-Received-Date: Mon, 21 Nov 2016 12:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2016-11-21 at 14:22 +0200, Maxin B. John wrote:
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/ofono/{ofono_1.18.bb => ofono_1.19.bb}
> (52%)

I had sent an update for this already
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/1289
71.html

:-)

Cheers,
Andre'


