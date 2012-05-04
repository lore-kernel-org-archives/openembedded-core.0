Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQDqZ-0006H6-RD
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 10:26:39 +0200
Received: by wibhj13 with SMTP id hj13so1006002wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=PJFq1hmzn5giPrW0WtZmKvAGr/JNHV99N3V5Jjfn1dM=;
	b=JYNOG17rLRg2JSsqsuhYbPg4ZHaAycLHXCVn5G0Mir8YOl7/yqDjRhFfBGfkjc/UNx
	6NhCzhoAVv6QFmPePt2oauSsGg4t82LWScsI54LSnHnpOCek5GwB7U7MYzwfonur0A/X
	Y/ZZRsTdW7/EaiZOeiBcG/cVio5YL0XFi92shpJjIWOPNWOjuN6zPGnyVIaxDlpXgyA0
	zXZFXlAKP2MaEREgd+kfWSK4dTXDN4jNbZ0B0ABJ5nUiGKji/vZftOZnn0GEXdhIDm7o
	/PID7znf/L/kwy1GFq0tA0zr9MoT2/snDFtVTYxHyz9SJ9/X9ddZaLP5puv5wyTXEsPo
	cTtA==
Received: by 10.180.94.7 with SMTP id cy7mr12147514wib.3.1336119413597;
	Fri, 04 May 2012 01:16:53 -0700 (PDT)
Received: from [192.168.1.35] (39.Red-81-33-71.dynamicIP.rima-tde.net.
	[81.33.71.39])
	by mx.google.com with ESMTPS id ex2sm12625061wib.8.2012.05.04.01.16.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 01:16:52 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1257)
Date: Fri, 4 May 2012 10:16:50 +0200
In-Reply-To: <20120504080242.GD3163@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
Message-Id: <D972CB64-8B60-4301-805E-5B9B869954FE@gmail.com>
X-Mailer: Apple Mail (2.1257)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 08:26:39 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_67210C10-1F2A-4926-9719-A16761FE77B5"

--Apple-Mail=_67210C10-1F2A-4926-9719-A16761FE77B5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Martin,

On May 4, 2012, at 10:02 AM, Martin Jansa wrote:
>=20
> Check this thread
> =
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg2=
4963.html

The above thread only discusses the warning, but no-one has fixed it =
yet. If you can tell me what needs to be done, I'll create a patch and =
post it back to the list.

Best regards,

Elvis Dowson=

--Apple-Mail=_67210C10-1F2A-4926-9719-A16761FE77B5
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Hi Martin,<div><br><div><div>On May 4, 2012, at 10:02 AM, Martin Jansa wrote:</div><blockquote type="cite"><div><font class="Apple-style-span" color="#000000"><br></font>Check this thread<br><a href="http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24963.html">http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24963.html</a><br></div></blockquote><br></div><div>The above thread only discusses the warning, but no-one has fixed it yet. If you can tell me what needs to be done, I'll create a patch and post it back to the list.</div></div><div><br></div><div>Best regards,</div><div><br></div><div>Elvis Dowson</div></body></html>

--Apple-Mail=_67210C10-1F2A-4926-9719-A16761FE77B5--
