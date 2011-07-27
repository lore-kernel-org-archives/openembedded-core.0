Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Qm6W7-0004Mi-7r
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:59:27 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Qm6S2-0001dN-6o from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 08:55:14 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 27 Jul 2011 08:52:22 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 27 Jul 2011 08:55:10 -0700
Message-ID: <4E3034D9.4030602@mentor.com>
Date: Wed, 27 Jul 2011 08:55:05 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311752531.git.sgw@linux.intel.com>	<4adc1ac758823bf95ef5259ecf90a7906b38afc9.1311752531.git.sgw@linux.intel.com>	<1311759861.30326.276.camel@phil-desktop>
	<4E303031.2070506@mentor.com>
	<1311781955.30326.387.camel@phil-desktop>
In-Reply-To: <1311781955.30326.387.camel@phil-desktop>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Jul 2011 15:52:22.0827 (UTC)
	FILETIME=[2C7E6FB0:01CC4C75]
Subject: Re: [Consolidated & Tested 24/35] siteinfo: Move certain bash entries to common-linux
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
X-List-Received-Date: Wed, 27 Jul 2011 15:59:27 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/27/2011 08:52 AM, Phil Blundell wrote:
> On Wed, 2011-07-27 at 08:35 -0700, Tom Rini wrote:
>> Agreed that we're far from complete here.  oe.dev has this one done and
>> once I've got the rest of the oe.dev re-sync done I'm just going to wipe
>> the site files clean and see what's needed anywhere, really.
> 
> Out of interest, why are you doing the resync first?  It seems like it
> would be a better use of time to wipe the site files clean and see which
> bits we need before spending time on syncing them up.

Partly to go from something working to something working better and
partly since I didn't realize just how bad things were until I started
digging.

-- 
Tom Rini
Mentor Graphics Corporation


