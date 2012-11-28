Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1Tdr8o-00086p-6v
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 00:34:06 +0100
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 5FFDE21363;
	Wed, 28 Nov 2012 15:19:51 -0800 (PST)
Message-ID: <50B69C16.6090700@windriver.com>
Date: Wed, 28 Nov 2012 15:19:50 -0800
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
References: <1351792979-6672-1-git-send-email-andy.ross@windriver.com>
	<50A68F5D.6050100@windriver.com> <1353343072.3709.183.camel@ted>
	<CAPhnLPBpv_LKEKjoqsv7TY2NhiJLB8kCtPU9im+r34hqKHtNVg@mail.gmail.com>
In-Reply-To: <CAPhnLPBpv_LKEKjoqsv7TY2NhiJLB8kCtPU9im+r34hqKHtNVg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 23:34:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2012 03:14 PM, Flanagan, Elizabeth wrote:
> This patch needs a rebase and a minor bit of whitespace work. I've
> done some work to make it apply to the current master head and tested
> it out and it does improve the utility of INCOMPATIBLE_LICENSE quite a
> bit.

Hm... AFAICT the content of the patch still seems to apply cleanly
with git am on a just-pulled poky (don't have an oe-core tree on this
machine) master HEAD.  Am I looking at a wrong branch?

> If it's ok with you, Andy, I'll just submit my modifications to your patch.

Fine with me.

Andy




