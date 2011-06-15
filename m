Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QWg0P-00024z-7o
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 04:38:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jun 2011 19:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,368,1304319600"; d="scan'208";a="14798047"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga001.jf.intel.com with ESMTP; 14 Jun 2011 19:35:28 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 15 Jun 2011 10:33:42 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 15 Jun 2011 10:33:40 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jun 2011 10:33:40 +0800
Thread-Topic: [OE-core] [PATCH 1/1] autoconf/automake: Bump PR to resolve
	perl-native issue
Thread-Index: Acwqaec1fn2YMleVQv6qnwwtw+wDUQAlpBew
Message-ID: <1865303E0DED764181A9D882DEF65FB699650124B3@shsmsx502.ccr.corp.intel.com>
References: <cover.1308000501.git.sgw@linux.intel.com>
	<f1001141de7bf605c79b8ae9b44160e4cda9e736.1308000501.git.sgw@linux.intel.com>
	<59F3EB02-7EFE-4E50-AD6E-A953952FEA6B@dominion.thruhere.net>
	<4DF71647.7000703@linux.intel.com>
In-Reply-To: <4DF71647.7000703@linux.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: "Wold, Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 1/1] autoconf/automake: Bump PR to resolve	perl-native issue
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
X-List-Received-Date: Wed, 15 Jun 2011 02:38:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Saul Wold wrote:
> On 06/14/2011 12:48 AM, Koen Kooi wrote:
>> To be clear: does the PR bump fix the issues or was there a fix
>> earlier that lacked a PR bump?=20
>>=20
> The fix was earlier and lacked the PR bump to these recipes.
Sorry for the issue and thanks Saul for the fix!
I knew the issue but I was not clear I should have bumped the PRs.=20
I thought autoconf/aumake-native themselves didn't change... I'll be more c=
areful.

Thanks,
-- Dexuan


