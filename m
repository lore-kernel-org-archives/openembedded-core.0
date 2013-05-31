Return-Path: <ross.burton@intel.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 541F260959
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 11:50:24 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id un4so2065712pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 04:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=c/aC96iowp9+UNchVXZGFLYSng9T45iVKYjNytxoZ50=;
	b=dVslTaumbZtT4BoAmuwYad3runTo/kCD/pcTtjm1km6+Bcl9wUjNh3zm1WlJeUtxaT
	K1jBbyGh1FF35LPqnAfy88li8m8EeUw7K8MQN9QtvNA+CSBfNZFKIBF7qH+liQ2WUh0I
	e/sjGFlVMcWDZwIAaHUGlhwogXh+FiCwzSJ2KOfDWGbnd531WyR1xZtcuwV1uckptJov
	Z529HSGaw2ZJ/Qk/SuL8oA0HVEkPl/uJJ90wGhdGsGzyRQbNCabxtDl5F97C+cMy8DKA
	YSaWpUuN/8CgNFCc7ptSbhNC/8JApwLvQdceQf82jME60AGCEzQuoY8JeH6OjiO9I0yV
	ZNZQ==
X-Received: by 10.68.239.228 with SMTP id vv4mr12591851pbc.5.1370001025449;
	Fri, 31 May 2013 04:50:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 04:50:05 -0700 (PDT)
In-Reply-To: <1369946430-12959-1-git-send-email-eric@eukrea.com>
References: <1369946430-12959-1-git-send-email-eric@eukrea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 12:50:05 +0100
Message-ID: <CAJTo0La+kkViaBo3R5Tmgj4L43zJOqkzKqayPTEg33gp=Vob8g@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQnxrkojgZxc9jKN0GIWYTm9PF4up83KFnaeJ3h+pLLTjOMYvHjZVxyHMzt6ma4MO6YYK0P7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] hicolor-icon-theme: keep inherited dependencies and switch to gnomebase
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
X-List-Received-Date: Fri, 31 May 2013 11:50:24 -0000
Content-Type: text/plain; charset=UTF-8

Signed-off-by: Ross Burton <ross.burton@intel.com>

