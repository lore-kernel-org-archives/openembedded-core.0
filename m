Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AFCDC78F73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 10:17:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7EAHBbt010740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 14 Aug 2018 11:17:12 +0100
Message-ID: <3f8b067d9a41667c7856388b819313761da9d03c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Aug 2018 11:17:11 +0100
In-Reply-To: <731A6113-251A-4CDB-9296-97E8BAF9619D@gmail.com>
References: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
	<CAJTo0Lam_z0M4oPwOoyPZMa=ZkWBj9qXKz8T1uMKFSiLS93Fgg@mail.gmail.com>
	<731A6113-251A-4CDB-9296-97E8BAF9619D@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Tue, 14 Aug 2018 10:17:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-08-14 at 12:02 +0200, Jens Rehsack wrote:
> I did on August, 8th - but I don't see it in master-next or any issue
> reported on that...
> Did it arrive?

I reported problems:

http://lists.openembedded.org/pipermail/openembedded-core/2018-August/153792.html

Basically the -native version doesn't build due to the changes to make
the target version work.

Cheers,

Richard

