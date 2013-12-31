Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id F0AA56B446
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 12:19:18 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id q58so11115758wes.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Dec 2013 04:19:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=6pe2LCWimiTUUEdIGGE5AV/eimVAQR9FI32Gg6gIZbo=;
	b=HNDRGC3WrxdWXWsRab645M8hsw0da9wx6cF/5M74wgA4HhRx7nCoS74cIIClg3WX9i
	JrrhefX1EXg6PI3vnp8xf0Ud535KWd+u5PZxngUjMKeATe3ddbvI+gEvH+TQFuG3HfWV
	aA7KcfaX1sT0/rrGL97RaKHBleLYffFJG/0yiMm/jBQlG1oFvJvI6JYN3SJCjtXDzlaz
	kdY+yd7tTrtZFTHTsKuYXKwUEp16sbfSPq9eMKp518ne6gqNYe8wQCBCwDbu46sann+l
	hd0R8Gq7r31t70QJE88lBdkPaQam4RAVUsTiTFfmEpyjZ8degemsHggCXvs/julnFOvu
	+/1w==
X-Gm-Message-State: ALoCoQlGWkqxHkJzqGQMM1cUdpgnjDZylmq8hywI/Hg4JFsr+ASkik/7vYdn8leLS7eTUEXvGLWb
X-Received: by 10.180.79.38 with SMTP id g6mr46985518wix.60.1388492359604;
	Tue, 31 Dec 2013 04:19:19 -0800 (PST)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id c1sm28015498wje.4.2013.12.31.04.19.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 31 Dec 2013 04:19:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
Date: Tue, 31 Dec 2013 13:19:16 +0100
Message-Id: <2704C375-0C8D-46B2-A11D-3FF220661AFB@dominion.thruhere.net>
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
To: krzysztof.m.sywula@intel.com
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Tue, 31 Dec 2013 12:19:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 dec. 2013, om 18:30 heeft krzysztof.m.sywula@intel.com het =
volgende geschreven:

> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
>=20
> ---
> meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++

that should be 0.8.15+0.8.16-rc1 to conform to the versioning policy=

