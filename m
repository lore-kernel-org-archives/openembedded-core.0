Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id ED91D719CA;
	Sat, 22 Oct 2016 17:27:22 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id s8so74360176pfj.2;
	Sat, 22 Oct 2016 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=OOWl4THgi7BTXr9nhm0TlPgdqVpGNB241gDiJZ0i5vo=;
	b=v5J5YtkslVJTKMxXzJLjUh44lwI0bI9+xYOB7JUir9nqgEoeF+iqOu9QCDV27Et9P3
	A3RprokNFO7He2XoksXMsZjXAnOTDoC7WIFpDrYrPGw9j6RTCPPEA4x7Pws2rh2zpL3Q
	0Mdd0A2lrSQWpilb+1r72ZMlHkMNmkiCHYO074ObXlkOw89jspajVhGilSkzkfx9UCoa
	tHyPXlInOdFhGwoh0p1Gsb7Bghp0m07a12f+9mbif4EVqW24PXMwrd/iXOmXoLbbrRV1
	n07cVFsHLzNmbCDK5TG1dPN69c5fXCm7ZudnTRE4sgvTLFElqgF3BDt5+sxUN0LPf94a
	7cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=OOWl4THgi7BTXr9nhm0TlPgdqVpGNB241gDiJZ0i5vo=;
	b=Jct8G0npOd8LQQfq1wAUjDbYvlEbBzZWNp2NvkrjdIuCjMzjOFERo6aYk8MvM7vC0n
	ClOnIRJL2iP0dJ59oTekQTIVdIcdMBtBid8towa78DLnXsvgkr0tDve5qWsjr6IFk5VC
	2kcBIzt9J7cp92TaZ5CRmlzbB6+bBLSK8ulJaGeTwb7IZiga1M3u9VDxLFvwi1A8nTpy
	Fe2Kp+mTJQNB4/c9kg+0oLgl95aOdCD97DwTdMjV7iY4FNTJNLxKCwE/FKrFwZKKBUlS
	qlWh2EsJu/+CZeocIpMRBxOetVnJZay+c7VWzV6ZFeFjTjd9TH7aMPaT38wqr7HcUxM7
	S9WQ==
X-Gm-Message-State: ABUngvc2cnp1Nno0MVri5NO0HdvTpBeWi9mynnCmcAgt7sjr7ukkjGNTPkkXYPrkSOHvAw==
X-Received: by 10.98.68.218 with SMTP id m87mr13047283pfi.20.1477157243861;
	Sat, 22 Oct 2016 10:27:23 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:fdf4:1afa:2b08:6b79])
	by smtp.googlemail.com with ESMTPSA id
	t128sm13653496pfd.65.2016.10.22.10.27.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Oct 2016 10:27:23 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <142664ed-14dc-6a12-3756-1664f65c70ad@gmail.com>
Date: Sat, 22 Oct 2016 10:27:27 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
Subject: OEDAM - Portland
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
X-List-Received-Date: Sat, 22 Oct 2016 17:27:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello OE Developers and Users,

The next OpenEmbedded developer's meeting will be held in Portland
before or after ELC; Feb 21-23.  A little over 4 months away.  In the
past, we have relied on funds outside of OE to make our developer
meetings a reality. This next meeting, we would like the OEDAM to be
self-funded. 

The OE Developer meetings occur twice a year and it's where OE
maintainers, developers, members and enthusiasts come together to
discuss issues and plan future development for OE. 

If you find yourself using OE, enjoying playing with it or are a company
using OE in a product, please consider donating to OE. You can find a
"Donate" button at http://openembedded.org. If you have any questions
regarding donation, please contact me, off-list.


Kind regards,

Armin




