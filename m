Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RZAiB-0008Qp-P7 for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:22:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA0FrLJ008290
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:15:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08250-01 for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:15:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBA0FihW008284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:15:45 GMT
Message-ID: <1323476156.5309.204.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 00:15:56 +0000
In-Reply-To: <2d2d1743ef68945a58a377e5787b955b3e0e1a84.1323451977.git.paul.eggleton@linux.intel.com>
References: <cover.1323451977.git.paul.eggleton@linux.intel.com>
	<2d2d1743ef68945a58a377e5787b955b3e0e1a84.1323451977.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] classes/rootfs_deb: implement query functions for buildhistory
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
X-List-Received-Date: Sat, 10 Dec 2011 00:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-12-09 at 17:34 +0000, Paul Eggleton wrote:
> Implement the functions required for buildhistory to be able to query
> installed packages, get dependencies etc. for deb-based images.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Merged to master, thanks.

Richard



