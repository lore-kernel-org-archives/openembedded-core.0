Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81A3160722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 08:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M8vPRG027600; Tue, 22 Mar 2016 08:57:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CNF3PZZfil6s; Tue, 22 Mar 2016 08:57:25 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2M8vJmT027594
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 22 Mar 2016 08:57:20 GMT
Message-ID: <1458637039.20442.34.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 08:57:19 +0000
In-Reply-To: <1458611456.5327.25.camel@intel.com>
References: <1458336286-21607-1-git-send-email-sgw@linux.intel.com>
	<1458611456.5327.25.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] parselogs: add new whitelist entries to address 4.4.3 issues
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
X-List-Received-Date: Tue, 22 Mar 2016 08:57:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-21 at 18:50 -0700, Saul Wold wrote:
> Did this v2 get missed?  I see the first patch got merged.

Clearly it got missed sorry. 

I appreciate that is frustrating for people, equally, we do some level
of testing of changes going in, which introduces delay and when you
have ~80 patches you're about to merge and scan the lists for new
versions, its sometimes hard to catch everything :(.

Its also even harder when the v2 is buried in some random git branch
somewhere which I appreciate in this case it wasn't but does cause
problems in general.

Cheers,

Richard





