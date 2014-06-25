Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D96960438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 22:41:33 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5PMfF3V022283; Wed, 25 Jun 2014 23:41:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 82w3b0sf6rih; Wed, 25 Jun 2014 23:41:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5PMfBWw022279
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 25 Jun 2014 23:41:13 +0100
Message-ID: <1403736065.2104.287.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 25 Jun 2014 23:41:05 +0100
In-Reply-To: <20140625162209.GC1580@denix.org>
References: <1403218403-3303-1-git-send-email-denis@denix.org>
	<20140620171338.GX27324@denix.org> <20140625005255.GB1580@denix.org>
	<2450957.82MqDgnpjo@peggleto-mobl5.ger.corp.intel.com>
	<20140625162209.GC1580@denix.org>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] udev: update init script for conditional probing of platform bus
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
X-List-Received-Date: Wed, 25 Jun 2014 22:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-06-25 at 12:22 -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 25, 2014 at 05:20:23PM +0100, Paul Eggleton wrote:
> > On Tuesday 24 June 2014 20:52:55 Denys Dmytriyenko wrote:
> > > Ping? Any comments? Any better suggestions?
> > 
> > Looks like Richard has merged this, FWIW.
> 
> Yes, I saw it. Already submitted backport for daisy... :)

I'd like this to see some testing in master for a while before we
backport it...

Cheers,

Richard


