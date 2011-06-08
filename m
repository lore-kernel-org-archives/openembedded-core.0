Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QURa8-00068m-Vk
	for openembedded-core@lists.linuxtogo.org;
	Thu, 09 Jun 2011 00:50:37 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QURCk-0002wO-4v from Tom_Rini@mentor.com ;
	Wed, 08 Jun 2011 15:26:26 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 8 Jun 2011 15:26:25 -0700
Received: from [172.30.36.148] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Wed, 8 Jun 2011 15:26:25 -0700
Message-ID: <4DEFF70C.6020405@mentor.com>
Date: Wed, 8 Jun 2011 15:26:20 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1307540102.git.paul.eggleton@linux.intel.com>
	<4DEFBA1F.9040304@mentor.com>
	<201106082313.00702.paul.eggleton@linux.intel.com>
In-Reply-To: <201106082313.00702.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 08 Jun 2011 22:26:25.0983 (UTC)
	FILETIME=[1AABFCF0:01CC262B]
Cc: openembedded-core@lists.linuxtogo.org
Subject: Re: [PATCH 0/1] Fix "ip route get"
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
X-List-Received-Date: Wed, 08 Jun 2011 22:50:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 06/08/2011 03:13 PM, Paul Eggleton wrote:
> On Wednesday 08 June 2011 19:06:23 Tom Rini wrote:
>> 2.6.38 is current (and in oe.dev), so why not that one?
> 
> I guess I was being conservative given we just got burned by upgrading to a 
> newer version (well, I say just, it was November IIRC). However if we want to 
> bite the bullet and go to 2.6.38 then I'll test & submit a patch to update to 
> that.

Or tell upstream something is broken again :)  Yes, I'd vote for .38,
anyhow...

-- 
Tom Rini
Mentor Graphics Corporation


