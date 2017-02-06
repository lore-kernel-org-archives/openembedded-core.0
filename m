Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E6B2D71996
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 16:30:35 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:c5f6:564a:5bbc:a813] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1camBT-0001BW-2s; Mon, 06 Feb 2017 17:30:35 +0100
Message-ID: <1486398630.22715.13.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 06 Feb 2017 16:30:30 +0000
In-Reply-To: <1486392281.22715.7.camel@pbcl.net>
References: <1486120259.13882.26.camel@pbcl.net>
	<1486120807.14144.68.camel@linuxfoundation.org>
	<1486124973.13882.29.camel@pbcl.net>
	<1486388525.22715.2.camel@pbcl.net>
	<1486391230.14144.82.camel@linuxfoundation.org>
	<1486392281.22715.7.camel@pbcl.net>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: RSS difficulties
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
X-List-Received-Date: Mon, 06 Feb 2017 16:30:36 -0000
Content-Type: multipart/alternative; boundary="=-olSiKQo8AGQna3MKn7B6"

--=-olSiKQo8AGQna3MKn7B6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

By the way, this message:

                   msgbuf.append("Skipping setscene dependency %s for
installation into the sysroot")
 
is not as illuminating as it could be.  I suppose it wants "%
setscenedeps[datadep][0])" on the end. :-}

p.

--=-olSiKQo8AGQna3MKn7B6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>By the way, this message:</div><div><br></div><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;msgbuf.append("Skipping setscene dependency %s for installation into the sysroot")</div><div>&nbsp;</div><div>is not as illuminating as it could be.  I suppose it wants "% setscenedeps[datadep][0])" on the end. :-}</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-olSiKQo8AGQna3MKn7B6--
