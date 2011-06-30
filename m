Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcQUC-0004Pi-NO for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 01:17:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNDhff002825;
	Fri, 1 Jul 2011 00:13:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00852-02; Fri,  1 Jul 2011 00:13:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UNDbxJ002806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 1 Jul 2011 00:13:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <008dd88fa2681138275d68f99f11262a3cf0219d.1309473383.git.scott.a.garman@intel.com>
References: <cover.1309473383.git.scott.a.garman@intel.com>
	<008dd88fa2681138275d68f99f11262a3cf0219d.1309473383.git.scott.a.garman@intel.com>
Date: Fri, 01 Jul 2011 00:13:17 +0100
Message-ID: <1309475597.20015.494.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 1/3] bitbake.conf: update PSEUDO_PASSWD variable
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
X-List-Received-Date: Thu, 30 Jun 2011 23:17:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 15:39 -0700, Scott Garman wrote:
> The internal use of PSEUDO_PASSWD adds the /etc path
> automatically.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>

Merged to master, thanks.

Richard



