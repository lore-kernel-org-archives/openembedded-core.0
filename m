Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RmnNn-0001TH-HG
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jan 2012 15:17:59 +0100
Received: by obcwo8 with SMTP id wo8so1806792obc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2012 06:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DzKd3IZeWuMVlOZk7esIXISCTNWx6iceSiSmWczrzWM=;
	b=xJx6OnUPWrFvfn1CpwxQWD9yHPQ+tPI9f3q3WeHVF700HZEmqF7S0gBtT34+S7Irn0
	bp07JwkBJRjvrRd6wLfgE2IK2vQq+lUfItQazBJpxL9n4JRXe36KRz8yXHf1x0+SMocU
	aymunA6LNX9TKOUN3H+3UBtJ/Ypq4gXjnSJuc=
MIME-Version: 1.0
Received: by 10.182.59.13 with SMTP id v13mr11100531obq.74.1326723022553; Mon,
	16 Jan 2012 06:10:22 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Mon, 16 Jan 2012 06:10:22 -0800 (PST)
In-Reply-To: <1326378001-11488-1-git-send-email-Martin.Jansa@gmail.com>
References: <48CE4DDF-8D48-43D4-A294-0E69A6D64608@dominion.thruhere.net>
	<1326378001-11488-1-git-send-email-Martin.Jansa@gmail.com>
Date: Mon, 16 Jan 2012 06:10:22 -0800
Message-ID: <CAGDS+nkBjFhP_zd8MtbSk6ke0=t1mADdyJJ8bk0jp9iyieL1eA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] dbus-1.4.16: use INC_PR from dbus.inc to fix PR bump after dbus-launch-helper permission change
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
X-List-Received-Date: Mon, 16 Jan 2012 14:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jan 12, 2012 at 6:20 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Tested-by: Steve Sakoman <steve@sakoman.com>


