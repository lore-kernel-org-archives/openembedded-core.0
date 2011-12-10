Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZAZZ-0008A3-0x for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:13:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA06wUB008018
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:06:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07544-07 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:06:54 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA06o28008012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:06:51 GMT
Message-ID: <1323475621.5309.198.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 00:07:01 +0000
In-Reply-To: <4EE25F11.80200@linux.intel.com>
References: <cover.1323358819.git.otavio@ossystems.com.br>
	<abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
	<4EE25F11.80200@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Sat, 10 Dec 2011 00:13:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 11:18 -0800, Darren Hart wrote:
> On 12/08/2011 07:40 AM, Otavio Salvador wrote:
> 
> Hi Otavio,
> 
> Please provide a commit log body.
> 
> http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages
> 
> 
> > +else
> > +	echo "WARNING: No cover letter will be send."
> 
> s/send/sent/
> 
> 
> Otherwise looks reasonable.

Hmm, this has just merged with the typo, sorry (it had been around a
while with no comments). Can someone sent a follow up please?

Cheers,

Richard




