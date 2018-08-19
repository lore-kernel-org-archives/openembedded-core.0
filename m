Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5473D79083
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:14:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7JMEXIx004313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Sun, 19 Aug 2018 23:14:34 +0100
Message-ID: <7c9d87fab906f591a715f298fd21f46e51797f05.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paulo Neves <ptsneves@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 19 Aug 2018 23:14:33 +0100
In-Reply-To: <CAJO0J4jmZYMGNHBUbJ70c=9d3JHVFFYwHJq4NrQUzYdBooy9Qw@mail.gmail.com>
References: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
	<CAJO0J4ig3xhEaukBrZFw2RCMzpXjbuXXFiMt8vP2edpsA8Wdxw@mail.gmail.com>
	<CAJO0J4jmZYMGNHBUbJ70c=9d3JHVFFYwHJq4NrQUzYdBooy9Qw@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [meta-oe][PATCH 1/3] testimage: Refactoring and fixing.
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
X-List-Received-Date: Sun, 19 Aug 2018 22:14:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-08-18 at 18:40 +0200, Paulo Neves wrote:
> Ping.
> 
> Does anybody have any comments? Also I noticed that my commit once
> was in the master-next but it was removed. Without it being in master
> I cannot submit my changes to poky mailing list with the fixes for
> the remaining targets.

I tried adding it to master-next, it broke things, I did reply about
it, I dropped it from -next due to the problems. My reply is here:

http://lists.openembedded.org/pipermail/openembedded-core/2018-August/154037.html

Cheers,

Richard

