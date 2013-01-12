Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Ttyrk-0000zA-5o for openembedded-core@lists.openembedded.org;
	Sat, 12 Jan 2013 12:03:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0CAlnvJ026232;
	Sat, 12 Jan 2013 10:47:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18272-04; Sat, 12 Jan 2013 10:47:44 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0CAleBe026225
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 12 Jan 2013 10:47:42 GMT
Message-ID: <1357987662.4072.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 12 Jan 2013 10:47:42 +0000
In-Reply-To: <cover.1357927839.git.sgw@linux.intel.com>
References: <cover.1357927839.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/28] Automake patches & other fixes
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
X-List-Received-Date: Sat, 12 Jan 2013 11:04:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-01-11 at 10:14 -0800, Saul Wold wrote:
> Richard,
> 
> Another batch of automake related changes from Marko (Thanks Marko!)
> 
> Along with some other fixes and patches, I have again included the
> cairo patch as I am not sure what your objection to it is.

Read the patch description/summary, then the patch contents and see if
you think the two match up. It may be a perfectly good patch (perhaps
fixing errors with uclibc?) but the explanation doesn't appear to say
that, or match the patch at all. I don't know what the mutex bit does.
The request is to clarify the patch description.

Cheers,

Richard



