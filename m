Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SH8TJ-000511-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 08:53:05 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Apr 2012 23:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128607346"
Received: from azsmsx601.amr.corp.intel.com ([10.2.121.193])
	by azsmga001.ch.intel.com with ESMTP; 08 Apr 2012 23:43:48 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	azsmsx601.amr.corp.intel.com (10.2.121.193) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sun, 8 Apr 2012 23:43:47 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.125]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.91]) with mapi id
	14.01.0355.002; Mon, 9 Apr 2012 14:43:45 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Thread-Topic: [OE-core] Do we have a package that installs the kernel
	headers and config into the target?
Thread-Index: Ac0TpDNglZsuvcTWTNSj8hhUp7EH6P//g5AA//9u5YCAALYcAP//ZSGggAFG7YD/+2vnEA==
Date: Mon, 9 Apr 2012 06:43:44 +0000
Message-ID: <A25F549E4D43CD42B4C02DF47A1913230FCFF550@SHSMSX102.ccr.corp.intel.com>
References: <A25F549E4D43CD42B4C02DF47A1913230FCFD3A2@SHSMSX102.ccr.corp.intel.com>
	<4F7E6914.7080908@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD49B@SHSMSX102.ccr.corp.intel.com>
	<4F7E881E.1000106@linux.intel.com>
	<A25F549E4D43CD42B4C02DF47A1913230FCFD667@SHSMSX102.ccr.corp.intel.com>
	<4F7F1873.5040607@linux.intel.com>
In-Reply-To: <4F7F1873.5040607@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Do we have a package that installs the kernel headers and config into the target?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Apr 2012 06:53:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Darren Hart wrote on 2012-04-07:
> On 04/06/2012 12:48 AM, Cui, Dexuan wrote:
> It seems to me some work is needed at ESDC to account for proper
> development techniques and not reward sloppy development. Writing
> maintainable code is an important part of professional software
> engineers do every day. Rewarding shortcuts and deliverables by any
> means necessary does students and the industry a disservice.
I agree.

Actually we delivered a 5-hour Yocto training (consisting of 4 sessions)
to the sophomore and junior students, but the feedbacks show many
students think, with the limited time, they only want to focus on
developing things that could make them win a prize, and they feel
Yocto isn't so easy as they expected -- they actually don't care
Yocto's powerful capability of customization and they only want a
distribution that has integrated every possible library or tool they
need...

Thanks,
-- Dexuan




