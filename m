Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8sc2-0008Kj-SY for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:52:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84Cdnlu016964;
	Tue, 4 Sep 2012 13:39:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16861-04; Tue,  4 Sep 2012 13:39:45 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84Cdd2t016958
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 13:39:40 +0100
Message-ID: <1346762374.30964.41.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 04 Sep 2012 13:39:34 +0100
In-Reply-To: <cover.1346737995.git.sgw@linux.intel.com>
References: <cover.1346737995.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/57] M4 RC1 Final Pull
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
X-List-Received-Date: Tue, 04 Sep 2012 12:52:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-03 at 22:58 -0700, Saul Wold wrote:
> Richard,
> 
> This is a grouping of changes for RC1 of Milestone 4 for 1.3,
> The build is still in progress on the AB infrastucture but 
> looking pretty green right now.
> 
> As we are coming into RC1, we I think these are good changes, but
> moving forward I will be looking for more directed bug fixes and
> less feature work.
> 
> Please review these changes and pull accordingly.
> 
> I think Paul's changes are good, but may need a little more soak
> time, I pulled them since we are at M4 RC1 and need to either break
> LSB now or better yet, the address the LSB issues
> 
> Please remember that Paul's changes have a meta-yocto pull also.

All things considered, I've decided to get on and merge this, thanks.

Richard



