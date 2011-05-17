Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QMPaI-0005uf-Cr
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 21:05:34 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QMPXL-0001Lj-RR from Tom_Rini@mentor.com ;
	Tue, 17 May 2011 12:02:31 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 17 May 2011 12:00:12 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 17 May 2011 12:02:31 -0700
Message-ID: <4DD2C641.8020906@mentor.com>
Date: Tue, 17 May 2011 12:02:25 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 17 May 2011 19:00:12.0954 (UTC)
	FILETIME=[A6AF17A0:01CC14C4]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v2 00/15] *-pull-request: cleanup and overhaul
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
X-List-Received-Date: Tue, 17 May 2011 19:05:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/16/2011 03:25 PM, Darren Hart wrote:

...
> Darren Hart (13):
>   create-pull-request: alphabetize arguments
>   create-pull-request: whitespace cleanup
>   create-pull-request: use git request-pull and arbitrary remotes
>   create-pull-request: rewrite known private URLs to public URLs
>   create-pull-request: provide an RFC mode via -c argument
>   send-pull-request: whitespace cleanup
>   send-pull-request: remove local mta support
>   send-pull-request: fix greedy auto-cc regex
>   send-pull-request: don't send all patches to everyone even with -a
>   send-pull-request: verify git sendemail config
>   create-pull-request: add untested oe repository support
>   send-pull-request: streamline git-send-email usage
>   *pull-request: add copyright, license, and descriptions
> 
> Otavio Salvador (2):
>   create-pull-request: do not check certificate
>   create-pull-request: add GitHub remote support

For the bits I'm cc'd on:
Acked-by: Tom Rini <tom_rini@mentor.com>

and thanks again for picking this up and running with it!

-- 
Tom Rini
Mentor Graphics Corporation


