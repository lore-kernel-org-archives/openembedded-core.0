Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 15ABB609BF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 03:05:17 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id l13so547879iga.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 20:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=arA5wnjSk5g8cZEFaloCWdYYnjvVjiMsHVeMXA/fqyc=;
	b=U2m+T7soVdcEbbn5Jsn7ZjaTU/HmQgFMGMt3Ln8CA5ENJoKxJsIRwp0prEf/puEp0K
	pfQANrDRjOCGEQzfUwDdP6gym+h7irtLWFJ3wKuAaFiplfTHZimQcEVF1u0H5/EQ+4UY
	D9KCXEuKhDdCvbMt5gp7mvuAggMZ5UCPSNtP/lxAmuOUvotVEi5iCyOwrIMdYiA9YZ29
	JVwWqn7bkIFOsGUQcXjxtiB/BKyuF9rotZmtg1nmILtapGLQ80xvmDxtebggUKXvb3Sz
	OsVnrqoPKf/ib5OOYu6ZESWHGWaCuqcjUNsOoigjhL5aszyal8gnPPgl5eOaUKN3+uIi
	qpRw==
X-Received: by 10.50.83.6 with SMTP id m6mr38306309igy.30.1399431918622; Tue,
	06 May 2014 20:05:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 20:04:48 -0700 (PDT)
In-Reply-To: <4520dfb98e41d7f6da81fd929993c4cf6979f698.1399431138.git.Qi.Chen@windriver.com>
References: <cover.1399431138.git.Qi.Chen@windriver.com>
	<4520dfb98e41d7f6da81fd929993c4cf6979f698.1399431138.git.Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 20:04:48 -0700
Message-ID: <CAMKF1srnp6FYiD7wtc=5JjnLw2iQNLR14N1pkGjbvssHJTL_WQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] sudo: upgrade from 1.8.9p5 to 1.8.10p2
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
X-List-Received-Date: Wed, 07 May 2014 03:05:22 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 7:53 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
> file now declares that compat/inet_pton.c bears a certain license.

be specific, which license

