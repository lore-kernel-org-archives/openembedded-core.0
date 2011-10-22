Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1RHffv-0000gy-C2
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Oct 2011 19:48:03 +0200
Received: by gyc15 with SMTP id 15so4548802gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2011 10:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Cf2FvcVZYZue9/qw6bzW3zh3qRpYzMvfqUa1B0XfnqM=;
	b=VtsJ2LjGKkY5AhLURLfg7pxve6p4NXbJwFj2IPxaPLgsnMl00eV7B842Xy1A+v2off
	KufFbri6Cfk9WeSsgE3AXjqyh2rszqQiUSg3UiXeC4gOHnvyO5yzPfK+wAAXAivNdO9W
	UtSjeLBbk4vp93agk610E+aXBuFdTZ2EntySI=
MIME-Version: 1.0
Received: by 10.236.77.133 with SMTP id d5mr26940752yhe.75.1319305327926; Sat,
	22 Oct 2011 10:42:07 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.236.60.198 with HTTP; Sat, 22 Oct 2011 10:42:07 -0700 (PDT)
In-Reply-To: <4EA19B3E.2020302@intel.com>
References: <1319028214-27568-1-git-send-email-cliff.brake@gmail.com>
	<20111019212659.GA30050@sakrah.homelinux.org>
	<4EA19B3E.2020302@intel.com>
Date: Sat, 22 Oct 2011 13:42:07 -0400
X-Google-Sender-Auth: UlK_sveQYzNhhYvQipDeGypOjWg
Message-ID: <CAOd_LFw1UnP2QZh7M7QX5O6ftDLfpaZf=s4i6kw7uP+UpcNchQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] squashfs-tools: add recipe (2nd try)
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
X-List-Received-Date: Sat, 22 Oct 2011 17:48:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 21, 2011 at 12:18 PM, Saul Wold <saul.wold@intel.com> wrote:
> This one is on hold pending an update from Cliff based on Khem's comments.

v3 posted.  Thanks for all the feedback.

Cliff


