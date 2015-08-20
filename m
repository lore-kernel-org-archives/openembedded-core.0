Return-Path: <radzy@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48F796013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:56:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7KNuA9g006259
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:56:10 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.206]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0235.001;
	Thu, 20 Aug 2015 16:56:10 -0700
From: "Radzykewycz, T (Radzy)" <radzy@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
Thread-Index: AQHQ214T/RTVAhp3Tk2Wq+uqAD3auZ4VkJaY
Date: Thu, 20 Aug 2015 23:56:09 +0000
Message-ID: <33006C99F5A5194A9B7A7715DFA3E383DC174D1B@ALA-MBB.corp.ad.wrs.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
	<10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
	<20150818083635.GE2458@jama>
	<CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>,
	<tor.121455D5F425.1070308@windriver.com>
In-Reply-To: <tor.121455D5F425.1070308@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.78]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
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
X-List-Received-Date: Thu, 20 Aug 2015 23:56:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I would very much prefer that the GPLv2 license of screen be
maintained.  What do I need to do to keep a GPLv2 license on
it ?

(Sorry for taking so long to respond to this, but I didn't see the
initial thread.)

Enjoy!

                                      -- radzy


________________________________________
From: Randy MacLeod [randy.macleod@windriver.com]
Sent: Thursday, August 20, 2015 8:37 AM
To: Radzykewycz, T (Radzy)
Subject: Re: [OE-core] [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1

On 19 August 2015 at 09:17, Jussi Kukkonen <jussi.kukkonen@intel.com<mailto=
:jussi.kukkonen@intel.com>> wrote:
>> * License is now GPLv3+
>
> What about GPLv2 version which was preserved (IIRC) in prevous patch?
>
> Why did you decide to drop it now?

Mostly because of Ross' comment "Is screen considered sufficiently
core that we should maintain both GPLv2 and v3 recipes?  I'm not
convinced it is".

I did try to coax people to explain their thoughts in a little more
detail (because I wasn't sure what exactly they were saying) in my
reply on Aug 12 but no-one did... So I figured it's better to talk
with patches: I believe maintaining the GPLv2 version is not a great
use of anyones time (and I think it's fair to say that the recipe
wasn't receiving the sort of attention it would have required) and
making a developer tool like that GPLv3 shouldn't be a problem to most
people.

FWIW, I still agree with my statement and with Jussi here.

Ross

