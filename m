Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0Dit-0003vm-61
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 17:07:49 +0100
Received: from mail-qa0-f70.google.com ([209.85.216.70])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 29 Jan 2013 07:52:05 -0800
Received: by mail-qa0-f70.google.com with SMTP id bs12so1074858qab.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2013 07:52:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=kVb9lgi/BfW1Vj7gY+svOWN4iiQ/n3PexTyl3FKmbX4=;
	b=JfW+Z0ZU4D4O8THRVw4tu9PIjrlTbtVsAocxmO4vbWKRfRfP1M+D6toYVydTlx/TJe
	+7mwsmoqlfFIRk/aU3JTdvojCqGgwZ8pSVtOt5em6kGVpIqU8TvN2m0kTT9rSmkww8Hq
	rYe4qiY1NtTbnZAVPP9F6E1OxJEhDfAPJ7TltzDVpLLfomFCWNjhN0GSEyS+4T7rF9I3
	rhfE5wX9MYmwGW50BWhfjRL8X7GMzCgxJ8rrssORy3WzFgIC6N7YNq90JSa8LP9jwAje
	THFs7yv4LvSAXUK9bR21PPwf1svY/7pD2mbqT+ewF8MaAwhwGKs4uiROfLV3WJsq4/vN
	qtpg==
X-Received: by 10.52.21.175 with SMTP id w15mr1264774vde.100.1359474724170;
	Tue, 29 Jan 2013 07:52:04 -0800 (PST)
X-Received: by 10.52.21.175 with SMTP id w15mr1264767vde.100.1359474724119;
	Tue, 29 Jan 2013 07:52:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Tue, 29 Jan 2013 07:51:44 -0800 (PST)
In-Reply-To: <1359473084-592-2-git-send-email-radu.moisan@intel.com>
References: <1359473084-592-1-git-send-email-radu.moisan@intel.com>
	<1359473084-592-2-git-send-email-radu.moisan@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 Jan 2013 15:51:44 +0000
Message-ID: <CAJTo0LZj43H6TA9oijT7HpeP_kCmphQVDPik0=Xcz0LxoDpqLg@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQmJkP55APVXbRFhwOkXEr9rS5hecUllUGM0viZcemRIBANNpxPXxj3wHCqGJXLaF8jXoiVScEvplbMYr1hOcQkFjDaQJvFFSyk4TgMD0HCqmLf2RogJc5H5t4GW/MgK9guxel/0g+Cb41BH6dhT4SAu7wH6gtMKQTCaK/EAP8cglliDzYRCaCN7bXiGDErg9Eva84Me
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: Remove -systemd postfix
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
X-List-Received-Date: Tue, 29 Jan 2013 16:07:49 -0000
Content-Type: text/plain; charset=UTF-8

On 29 January 2013 15:24, Radu Moisan <radu.moisan@intel.com> wrote:
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>

Acked-by: Ross Burton <ross.burton@intel.com>

Ross


