Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SSGvM-0003i9-Ok
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:08:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q49Nw9Bi001222
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 May 2012 16:58:09 -0700 (PDT)
Received: from wrlaptop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 9 May 2012 16:58:08 -0700
Date: Wed, 9 May 2012 18:58:06 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120509185806.39aa48fb@wrlaptop>
In-Reply-To: <4FAAFE81.8010600@linux.intel.com>
References: <cover.1335922726.git.peter.seebach@windriver.com>
	<4FAAFE81.8010600@linux.intel.com>
X-Mailer: Claws Mail 3.7.8 (GTK+ 2.24.4; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: v4 or so [PATCH 0/3] sanity.bbclass and friends: toolchain sanity
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
X-List-Received-Date: Thu, 10 May 2012 00:08:05 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Wed, 9 May 2012 16:32:17 -0700
Saul Wold <sgw@linux.intel.com> wrote:

> >    sanity.bbclass: Check for bogus values in BBCLASSEXTEND
> >  
> RP commented on this one.

I'm gonna drop that for now, I think.  I am looking a little at
per-package sanity checking, but it turns out to be harder than I would
ideally like.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.


