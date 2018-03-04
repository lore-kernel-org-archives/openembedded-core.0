Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0CD78A61
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 13:20:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w24DKt1T014898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 4 Mar 2018 13:20:56 GMT
Message-ID: <1520169655.3436.64.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Sun, 04 Mar 2018 13:20:55 +0000
In-Reply-To: <CA+chaQfHzRvmJCGzsDht2tJwyMuVP01oM4Uorf83kUS3_1TAVA@mail.gmail.com>
References: <20180131191038.99-1-Martin.Jansa@gmail.com>
	<CA+chaQfHzRvmJCGzsDht2tJwyMuVP01oM4Uorf83kUS3_1TAVA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Daniel Lublin <daniel@lublin.se>, Pavel Modilaynen <pavelmn@axis.com>
Subject: Re: [morty][PATCH] buildstats.bbclass: Avoid index exception in /proc/PID/io parsing
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
X-List-Received-Date: Sun, 04 Mar 2018 13:20:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-03-04 at 12:41 +0100, Martin Jansa wrote:
> ping

I've queued this and the other morty patch in morty-next. Looks like
we'll need to do further rounds of testing.

Cheers,

Richard

