Return-Path: <abuse@basmevissen.nl>
Received: from hosting.emcodev.net (hosting.emcodev.net [178.18.92.162])
	by mail.openembedded.org (Postfix) with ESMTP id CAE6B745B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 7AEC3212003;
	Mon,  4 Jun 2018 15:23:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at hosting.emcodev.net
Received: from hosting.emcodev.net ([127.0.0.1])
	by localhost (hosting.emcodev.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MRwQQzip9-a2; Mon,  4 Jun 2018 15:23:46 +0200 (CEST)
Received: from emcodev.nl (localhost [127.0.0.1])
	by hosting.emcodev.net (Postfix) with ESMTP id 19090212002;
	Mon,  4 Jun 2018 15:23:46 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 04 Jun 2018 15:23:46 +0200
From: Bas Mevissen <abuse@basmevissen.nl>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <0c5a1317-bbed-4de5-d0d7-d34989d53e7e@linux.intel.com>
References: <be75fca2a4a635993bfaf89073fc0bd3@basmevissen.nl>
	<0c5a1317-bbed-4de5-d0d7-d34989d53e7e@linux.intel.com>
Message-ID: <531e7dab22fda95e4f30e14960590d36@basmevissen.nl>
X-Sender: abuse@basmevissen.nl
User-Agent: Roundcube Webmail/1.3.6
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: Summary of kernel-devsrc package issues (Sumo)
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
X-List-Received-Date: Mon, 04 Jun 2018 13:23:47 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2018-06-04 13:32, Alexander Kanavin wrote:
> On 06/04/2018 12:04 PM, Bas Mevissen wrote:
>> I ran into several issues with kernel-devsrc when building Poky Sumu 
>> with the meta-freescale layer for an Freescale i.mx6sx ARM board. In 
>> this mail(thread) I would like to collect them all and discuss the 
>> possible options to resolve them.
> 
> This is probably better discussed here:
> https://lists.yoctoproject.org/listinfo/linux-yocto
> 

Tnx for the pointer. However, this surprises me a bit. The charter of 
that ML says: "Development list for the linux-yocto*.git Linux kernel 
repositories.", while my issues are with a package contained in 
openembedded-core.


> Alex

Regards,

Bas.

